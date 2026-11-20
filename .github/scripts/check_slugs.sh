#!/usr/bin/env bash
set -euo pipefail

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
root=$(cd -- "$script_dir/../.." && pwd -P)
output=slugs.json

usage() {
    printf '%s\n' \
        'Usage: bash check_slugs.sh [--root DIRECTORY] [--output FILE]' \
        'Validate published article links against Markdown slugs and scripts/generated-slugs.txt.' \
        'Requires Bash 4.4+ and standard awk, find, sort, and mktemp utilities.' \
        'Front-matter slug and publication fields must be scalar values.'
}

while (($#)); do
    case $1 in
        --root|--output)
            if (($# < 2)); then
                printf 'Missing value for %s\n' "$1" >&2
                exit 2
            fi
            if [[ $1 == --root ]]; then root=$2; else output=$2; fi
            shift 2
            ;;
        --root=*) root=${1#*=}; shift ;;
        --output=*) output=${1#*=}; shift ;;
        -h|--help) usage; exit 0 ;;
        *) printf 'Unknown argument: %s\n' "$1" >&2; usage >&2; exit 2 ;;
    esac
done

if [[ ! -d $root ]]; then
    printf 'Repository directory does not exist: %s\n' "$root" >&2
    exit 2
fi
root=$(cd -- "$root" && pwd -P)
for utility in awk find sort mktemp; do
    if ! command -v "$utility" >/dev/null; then
        printf 'Required utility not found: %s\n' "$utility" >&2
        exit 1
    fi
done

export LC_ALL=C
temporary=$(mktemp -d)
trap 'rm -rf -- "$temporary"' EXIT

find "$root" -mindepth 1 \
    \( -type d \( -name '.*' -o -name node_modules -o -name vendor -o -name _site -o -name _build \) -prune \) \
    -o \( -type f -iname '*.md' -print0 \) |
    sort -z > "$temporary/files"
mapfile -d '' -t articles < "$temporary/files"

manifest=scripts/generated-slugs.txt
inputs=()
if [[ -r $root/$manifest ]]; then
    inputs+=("$root/$manifest")
else
    printf 'E\t%s\t1\tCannot read generated slug inventory\n' "$manifest" > "$temporary/missing"
fi
inputs+=("${articles[@]}" /dev/null)
awk -v phase=scan -v root="$root" -v manifest="$manifest" \
    -f "$script_dir/check_slugs.awk" "${inputs[@]}" > "$temporary/records"
if [[ -f $temporary/missing ]]; then
    cat "$temporary/missing" >> "$temporary/records"
fi
sort "$temporary/records" > "$temporary/sorted"
awk -v phase=validate -v output="$output" -v article_count="${#articles[@]}" \
    -v actions="${GITHUB_ACTIONS:-}" -f "$script_dir/check_slugs.awk" "$temporary/sorted"
