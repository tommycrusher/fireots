#!/usr/bin/env bash
# Analyze upstream commits from opentibiabr/canary
# Categorize by priority: CRITICAL, HIGH, MEDIUM, LOW

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

cd "$PROJECT_ROOT"

echo "🔍 UPSTREAM COMMIT ANALYSIS"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Count total commits
TOTAL=$(git rev-list --count main..upstream/main)
echo "📊 Total commits to review: $TOTAL"
echo ""

# Create output file
OUTPUT="upstream_analysis_$(date +%Y%m%d).txt"
echo "Fireots Upstream Analysis - $(date)" > "$OUTPUT"
echo "=======================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Categorize commits by keywords
echo "🔴 CRITICAL (Security, Crashes, Data Loss):"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
CRITICAL=$(git log --oneline main..upstream/main | grep -iE "(security|crash|null|segfault|corruption|exploit|vulnerability|cve)" || true)
CRITICAL_COUNT=$(echo "$CRITICAL" | grep -v "^$" | wc -l || echo 0)
echo "Found: $CRITICAL_COUNT commits"
echo "$CRITICAL" | head -10
echo ""
echo "## CRITICAL ($CRITICAL_COUNT commits)" >> "$OUTPUT"
echo "$CRITICAL" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# High priority: fixes for important features
echo "🟠 HIGH PRIORITY (Important Fixes, Performance):"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
HIGH=$(git log --oneline main..upstream/main | grep -iE "(fix:.*player|fix:.*monster|fix:.*item|fix:.*trade|fix:.*party|fix:.*guild|fix:.*quest|perf:|performance|memory leak|deadlock)" | grep -viE "(security|crash|null)" || true)
HIGH_COUNT=$(echo "$HIGH" | grep -v "^$" | wc -l || echo 0)
echo "Found: $HIGH_COUNT commits"
echo "$HIGH" | head -10
echo ""
echo "## HIGH PRIORITY ($HIGH_COUNT commits)" >> "$OUTPUT"
echo "$HIGH" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Medium priority: features, improvements
echo "🟡 MEDIUM PRIORITY (Features, Improvements):"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
MEDIUM=$(git log --oneline main..upstream/main | grep -iE "(feat:|feature:|improve:|refactor:)" | head -20 || true)
MEDIUM_COUNT=$(git log --oneline main..upstream/main | grep -iE "(feat:|feature:|improve:|refactor:)" | wc -l || echo 0)
echo "Found: $MEDIUM_COUNT commits"
echo "$MEDIUM" | head -10
echo ""
echo "## MEDIUM PRIORITY ($MEDIUM_COUNT commits - showing 20)" >> "$OUTPUT"
echo "$MEDIUM" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Low priority: chores, docs, tests
echo "🟢 LOW PRIORITY (Chores, Docs, Tests):"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
LOW=$(git log --oneline main..upstream/main | grep -iE "(chore:|docs:|test:|ci:)" | head -10 || true)
LOW_COUNT=$(git log --oneline main..upstream/main | grep -iE "(chore:|docs:|test:|ci:)" | wc -l || echo 0)
echo "Found: $LOW_COUNT commits"
echo "$LOW"
echo ""
echo "## LOW PRIORITY ($LOW_COUNT commits - showing 10)" >> "$OUTPUT"
echo "$LOW" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Summary
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📈 SUMMARY:"
echo "   Critical:   $CRITICAL_COUNT"
echo "   High:       $HIGH_COUNT"
echo "   Medium:     $MEDIUM_COUNT"
echo "   Low:        $LOW_COUNT"
CATEGORIZED=$((CRITICAL_COUNT + HIGH_COUNT + MEDIUM_COUNT + LOW_COUNT))
UNCATEGORIZED=$((TOTAL - CATEGORIZED))
echo "   Other:      $UNCATEGORIZED"
echo "   ─────────────────"
echo "   TOTAL:      $TOTAL"
echo ""

echo "## SUMMARY" >> "$OUTPUT"
echo "Critical:      $CRITICAL_COUNT" >> "$OUTPUT"
echo "High Priority: $HIGH_COUNT" >> "$OUTPUT"
echo "Medium:        $MEDIUM_COUNT" >> "$OUTPUT"
echo "Low:           $LOW_COUNT" >> "$OUTPUT"
echo "Uncategorized: $UNCATEGORIZED" >> "$OUTPUT"
echo "TOTAL:         $TOTAL" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Recent commits (last 50)
echo "## RECENT COMMITS (Last 50)" >> "$OUTPUT"
git log --oneline main..upstream/main -50 >> "$OUTPUT"

echo "✅ Analysis saved to: $OUTPUT"
echo ""
echo "💡 Next steps:"
echo "   1. Review CRITICAL commits first"
echo "   2. Cherry-pick security/crash fixes"
echo "   3. Test each integration"
echo "   4. Document in UPSTREAM_INTEGRATION.md"
