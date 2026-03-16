#!/usr/bin/env bash
set -euo pipefail

# Resolve repo root relative to this script, regardless of where it's called from
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

TARGET_FILE="$REPO_ROOT/designing-reports/report-designer-tools/web-report-designer/localizing-the-web-report-designer.md"
BUILD_VERSION="$(grep -E '^\s+buildversion:' "$REPO_ROOT/docs-builder.yml" | sed 's/.*buildversion:[[:space:]]*"\?\([^"[:space:]]*\)"\?.*/\1/')"
URL="https://reporting.cdn.telerik.com/${BUILD_VERSION}/js/WebReportDesignerStringsBase.js"
PLACEHOLDER="\`replace-wrd-strings-base\`"

echo "Fetching Web Report Designer Strings Resources JS snippet from $URL ..."
JS_TEMP=$(mktemp)
curl -fsSL "$URL" > "$JS_TEMP"

echo "Replacing placeholder in $TARGET_FILE ..."
OUT_TEMP=$(mktemp)

while IFS= read -r line || [[ -n "$line" ]]; do
    if [[ "$line" == *'`replace-wrd-strings-base`'* ]]; then
        printf '   ```JavaScript\n'
        # Strip BOM (U+FEFF), remove super(...arguments) line, then indent every line with 3 spaces
        sed 's/^\xef\xbb\xbf//' "$JS_TEMP" | grep -v 'super(\.\.\.arguments)' | sed 's/^/   /'
        printf '   ```\n'
    else
        printf '%s\n' "$line"
    fi
done < "$TARGET_FILE" > "$OUT_TEMP"

mv "$OUT_TEMP" "$TARGET_FILE"
rm -f "$JS_TEMP"

echo "Finished replacing Web Report Designer Strings Resources JS snippet."
