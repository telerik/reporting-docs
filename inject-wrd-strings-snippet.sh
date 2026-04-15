#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <path-to-WebReportDesignerStringsBase.js>"
    exit 1
fi

JS_FILE="$1"

if [[ ! -f "$JS_FILE" ]]; then
    echo "Error: File not found: $JS_FILE"
    exit 1
fi

# Resolve repo root relative to this script, regardless of where it's called from
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

TARGET_FILE="$REPO_ROOT/designing-reports/report-designer-tools/web-report-designer/localizing-the-web-report-designer.md"

echo "Using Web Report Designer Strings Resources JS from $JS_FILE ..."
OUT_TEMP=$(mktemp)

while IFS= read -r line || [[ -n "$line" ]]; do
    if [[ "$line" == *'`replace-wrd-strings-base`'* ]]; then
        printf '   ```JavaScript\n'
        # Strip BOM (U+FEFF), remove super(...arguments) line, then indent every line with 3 spaces
        sed 's/^\xef\xbb\xbf//' "$JS_FILE" | grep -v 'super(\.\.\.arguments)' | sed 's/^/   /'
        printf '   ```\n'
    else
        printf '%s\n' "$line"
    fi
done < "$TARGET_FILE" > "$OUT_TEMP"

mv "$OUT_TEMP" "$TARGET_FILE"

echo "Finished replacing Web Report Designer Strings Resources JS snippet."
