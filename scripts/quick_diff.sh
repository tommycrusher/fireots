#!/usr/bin/env bash
# Quick diff script for data-canary vs data-fire
# Usage: ./scripts/quick_diff.sh [file_path]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

CANARY_DIR="$PROJECT_ROOT/data-canary"
FIRE_DIR="$PROJECT_ROOT/data-fire"

# If specific file provided, diff only that file
if [ -n "$1" ]; then
    FILE="$1"
    CANARY_FILE="$CANARY_DIR/$FILE"
    FIRE_FILE="$FIRE_DIR/$FILE"

    if [ ! -f "$CANARY_FILE" ]; then
        echo "❌ File not found in data-canary: $FILE"
        exit 1
    fi

    if [ ! -f "$FIRE_FILE" ]; then
        echo "⚠️  File not found in data-fire: $FILE"
        echo "This is a canary-only file!"
        exit 0
    fi

    echo "📄 Comparing: $FILE"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    diff -u "$FIRE_FILE" "$CANARY_FILE" || true
    echo ""
    exit 0
fi

# Otherwise, show summary of all differences
echo "🔍 Scanning for differences between data-canary and data-fire..."
echo ""

DIFF_COUNT=0
DIFF_FILES=()

# Find all .lua files in data-canary/scripts
while IFS= read -r -d '' canary_file; do
    # Get relative path
    rel_path="${canary_file#$CANARY_DIR/}"
    fire_file="$FIRE_DIR/$rel_path"

    if [ ! -f "$fire_file" ]; then
        echo "⚠️  Canary-only: $rel_path"
        ((DIFF_COUNT++))
        DIFF_FILES+=("$rel_path")
        continue
    fi

    # Quick diff check (exit code only)
    if ! diff -q "$fire_file" "$canary_file" > /dev/null 2>&1; then
        echo "📝 Different: $rel_path"
        ((DIFF_COUNT++))
        DIFF_FILES+=("$rel_path")
    fi
done < <(find "$CANARY_DIR/scripts" -name "*.lua" -type f -print0)

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📊 Summary: $DIFF_COUNT files with differences"
echo ""

if [ $DIFF_COUNT -gt 0 ]; then
    echo "To see detailed diff for a file, run:"
    echo "  ./scripts/quick_diff.sh scripts/path/to/file.lua"
    echo ""
    echo "Files with differences:"
    for file in "${DIFF_FILES[@]}"; do
        echo "  - $file"
    done
fi
