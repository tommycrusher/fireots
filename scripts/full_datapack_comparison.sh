#!/usr/bin/env bash
# Complete comparison between data-canary and data-fire
# Shows which files exist only in canary, only in fire, or in both

set -e

CANARY="/home/tom/fireots/data-canary"
FIRE="/home/tom/fireots/data-fire"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📊 COMPLETE DATAPACK COMPARISON: data-canary vs data-fire"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Function to compare directories
compare_dir() {
    local subdir="$1"
    local canary_dir="$CANARY/$subdir"
    local fire_dir="$FIRE/$subdir"

    echo "📁 $subdir/"
    echo "   ────────────────────────────────────────"

    if [ ! -d "$canary_dir" ]; then
        echo "   ⚠️  Not present in data-canary"
        echo ""
        return
    fi

    if [ ! -d "$fire_dir" ]; then
        echo "   ⚠️  Not present in data-fire"
        echo ""
        return
    fi

    local canary_only=0
    local fire_only=0
    local both_identical=0
    local both_different=0

    # Files only in canary
    while IFS= read -r -d '' file; do
        rel_path="${file#$canary_dir/}"
        fire_file="$fire_dir/$rel_path"

        if [ ! -f "$fire_file" ]; then
            ((canary_only++))
            echo "   🔵 Canary-only: $rel_path"
        elif diff -q "$file" "$fire_file" > /dev/null 2>&1; then
            ((both_identical++))
        else
            ((both_different++))
            echo "   🟡 Different: $rel_path"
        fi
    done < <(find "$canary_dir" -type f -print0)

    # Files only in fire
    while IFS= read -r -d '' file; do
        rel_path="${file#$fire_dir/}"
        canary_file="$canary_dir/$rel_path"

        if [ ! -f "$canary_file" ]; then
            ((fire_only++))
        fi
    done < <(find "$fire_dir" -type f -print0)

    echo "   📊 Summary:"
    echo "      • Identical in both: $both_identical"
    echo "      • Different versions: $both_different"
    echo "      • Only in canary: $canary_only"
    echo "      • Only in fire: $fire_only"
    echo ""
}

# Compare each major directory
compare_dir "monster"
compare_dir "npc"
compare_dir "scripts"
compare_dir "lib"
compare_dir "migrations"
compare_dir "raids"
compare_dir "world"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ Comparison complete!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
