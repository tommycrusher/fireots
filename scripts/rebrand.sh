#!/bin/bash
# rebrand.sh - Systematic Fireots Rebranding Script
#
# WARNING: This script makes extensive changes to the codebase.
# ALWAYS run on a clean git branch and review changes before committing.
#
# Usage: ./scripts/rebrand.sh [--dry-run]
#

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Counters
FILES_MODIFIED=0
DRY_RUN=false

# Parse arguments
if [[ "${1:-}" == "--dry-run" ]]; then
    DRY_RUN=true
    echo -e "${YELLOW}Running in DRY RUN mode - no files will be modified${NC}"
fi

# Function to print info messages
info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

# Function to print warning messages
warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

# Function to print error messages
error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to safely replace in file
safe_replace() {
    local file="$1"
    local pattern="$2"
    local replacement="$3"

    if [[ ! -f "$file" ]]; then
        warn "File not found: $file"
        return 1
    fi

    if $DRY_RUN; then
        if grep -q "$pattern" "$file"; then
            echo "  Would modify: $file"
            ((FILES_MODIFIED++))
        fi
    else
        if grep -q "$pattern" "$file"; then
            sed -i "s|$pattern|$replacement|g" "$file"
            ((FILES_MODIFIED++))
            echo "  Modified: $file"
        fi
    fi
}

# Check if we're in project root
if [[ ! -f "CMakeLists.txt" ]] || [[ ! -d "src" ]]; then
    error "This script must be run from the project root directory"
    exit 1
fi

# Confirm with user unless dry run
if ! $DRY_RUN; then
    echo -e "${RED}WARNING: This will modify many files in the repository.${NC}"
    echo -e "${YELLOW}Make sure you have committed or backed up your work.${NC}"
    read -p "Continue? (yes/no): " confirm
    if [[ "$confirm" != "yes" ]]; then
        echo "Aborted."
        exit 0
    fi
fi

info "Starting Fireots rebranding process..."

# ============================================================================
# PHASE 1: Update source file headers
# ============================================================================

info "Phase 1: Updating source file headers..."

# Find all .cpp and .hpp files
find src/ tests/ -type f \( -name "*.cpp" -o -name "*.hpp" \) | while read -r file; do
    # Replace Canary with Fireots in first line
    safe_replace "$file" \
        "Canary - A free and open-source MMORPG server emulator" \
        "Fireots - A free and open-source MMORPG server emulator"

    # Add Fireots copyright line after OpenTibiaBR line
    if ! $DRY_RUN && grep -q "Copyright (©) 2019-2024 OpenTibiaBR" "$file"; then
        # Check if Fireots copyright already exists
        if ! grep -q "Copyright (©) 2024-2025 Fireots Team" "$file"; then
            sed -i '/Copyright (©) 2019-2024 OpenTibiaBR/a \ * Copyright (©) 2024-2025 Fireots Team <contact@fireots.pl>' "$file"
            echo "  Added Fireots copyright: $file"
        fi
    fi

    # Update repository URL
    safe_replace "$file" \
        "Repository: https://github.com/opentibiabr/canary" \
        "Repository: https://github.com/tommycrusher/fireots"

    # Update license URL
    safe_replace "$file" \
        "License: https://github.com/opentibiabr/canary/blob/main/LICENSE" \
        "License: https://github.com/tommycrusher/fireots/blob/main/LICENSE"

    # Update contributors URL
    safe_replace "$file" \
        "Contributors: https://github.com/opentibiabr/canary/graphs/contributors" \
        "Contributors: https://github.com/tommycrusher/fireots/graphs/contributors"

    # Update website URL
    safe_replace "$file" \
        "Website: https://docs.opentibiabr.com/" \
        "Website: https://docs.fireots.pl/"
done

info "Phase 1 complete: Headers updated in source files"

# ============================================================================
# PHASE 2: Rename main classes
# ============================================================================

info "Phase 2: Renaming main classes..."

# Rename CanaryServer to FireotsServer
find src/ -type f \( -name "*.cpp" -o -name "*.hpp" \) | while read -r file; do
    safe_replace "$file" "CanaryServer" "FireotsServer"
done

# Rename FailedToInitializeCanary to FailedToInitializeFireots
find src/ -type f \( -name "*.cpp" -o -name "*.hpp" \) | while read -r file; do
    safe_replace "$file" "FailedToInitializeCanary" "FailedToInitializeFireots"
done

# Rename files
if ! $DRY_RUN; then
    if [[ -f "src/canary_server.cpp" ]]; then
        git mv src/canary_server.cpp src/fireots_server.cpp
        info "Renamed: src/canary_server.cpp -> src/fireots_server.cpp"
    fi
    if [[ -f "src/canary_server.hpp" ]]; then
        git mv src/canary_server.hpp src/fireots_server.hpp
        info "Renamed: src/canary_server.hpp -> src/fireots_server.hpp"
    fi
else
    info "Would rename: src/canary_server.cpp -> src/fireots_server.cpp"
    info "Would rename: src/canary_server.hpp -> src/fireots_server.hpp"
fi

# Update includes
find src/ -type f \( -name "*.cpp" -o -name "*.hpp" \) | while read -r file; do
    safe_replace "$file" '#include "canary_server.hpp"' '#include "fireots_server.hpp"'
done

info "Phase 2 complete: Main classes renamed"

# ============================================================================
# PHASE 3: Update CMake project name
# ============================================================================

info "Phase 3: Updating CMake configuration..."

safe_replace "CMakeLists.txt" "project(canary)" "project(fireots)"
safe_replace "CMakeLists.txt" "project(canary-debug)" "project(fireots-debug)"

# Update executable name in CMakeLists
find cmake/ src/CMakeLists.txt -type f -name "*.cmake" -o -name "CMakeLists.txt" | while read -r file; do
    safe_replace "$file" 'set(EXECUTABLE_NAME "canary")' 'set(EXECUTABLE_NAME "fireots")'
    safe_replace "$file" "canary" "fireots"
done

info "Phase 3 complete: CMake configuration updated"

# ============================================================================
# PHASE 4: Update scripts
# ============================================================================

info "Phase 4: Updating shell scripts..."

# recompile.sh
if [[ -f "recompile.sh" ]]; then
    safe_replace "recompile.sh" 'local executable_name="canary"' 'local executable_name="fireots"'
    safe_replace "recompile.sh" "setup_canary" "setup_fireots"
    safe_replace "recompile.sh" "build_canary" "build_fireots"
    safe_replace "recompile.sh" "Canary" "Fireots"
    safe_replace "recompile.sh" "canary folder" "fireots folder"
fi

# start_fire.sh
if [[ -f "start_fire.sh" ]]; then
    safe_replace "start_fire.sh" './fire' './fireots'
fi

# start_gdb.sh
if [[ -f "start_gdb.sh" ]]; then
    safe_replace "start_gdb.sh" "canary" "fireots"
fi

info "Phase 4 complete: Shell scripts updated"

# ============================================================================
# PHASE 5: Update configuration validation
# ============================================================================

info "Phase 5: Updating configuration validation..."

if [[ -f "src/fireots_server.cpp" ]]; then
    CONFIG_FILE="src/fireots_server.cpp"
elif [[ -f "src/canary_server.cpp" ]]; then
    CONFIG_FILE="src/canary_server.cpp"
fi

if [[ -n "${CONFIG_FILE:-}" ]]; then
    # This is a complex replacement - show warning
    warn "Configuration validation in $CONFIG_FILE needs manual review"
    warn "Replace hardcoded 'data-canary', 'data-otservbr-global' checks with 'data-fire'"
fi

info "Phase 5 complete: Configuration validation noted for manual review"

# ============================================================================
# PHASE 6: Update Docker files
# ============================================================================

info "Phase 6: Updating Docker configuration..."

find docker/ -type f \( -name "Dockerfile*" -o -name "docker-compose.yml" \) | while read -r file; do
    safe_replace "$file" "opentibiabr/canary" "fireots/fireots"
    safe_replace "$file" "/canary/" "/fireots/"
    safe_replace "$file" "COPY.*canary" "COPY fireots"
done

info "Phase 6 complete: Docker files updated"

# ============================================================================
# PHASE 7: Update documentation files
# ============================================================================

info "Phase 7: Updating documentation..."

# README.md
if [[ -f "README.md" ]]; then
    safe_replace "README.md" "opentibiabr/canary" "tommycrusher/fireots"
    safe_replace "README.md" "docs.opentibiabr.com" "docs.fireots.pl"
fi

# CODE_OF_CONDUCT.md
if [[ -f "CODE_OF_CONDUCT.md" ]]; then
    safe_replace "CODE_OF_CONDUCT.md" "opentibiabr@outlook.com" "contact@fireots.pl"
    safe_replace "CODE_OF_CONDUCT.md" "opentibiabr/canary" "tommycrusher/fireots"
fi

# Test files
find tests/ -type f \( -name "*.cpp" -o -name "*.hpp" -o -name "*.sh" \) | while read -r file; do
    safe_replace "$file" "canary_unittest" "fireots_unittest"
    safe_replace "$file" "canary_ut" "fireots_ut"
done

info "Phase 7 complete: Documentation updated"

# ============================================================================
# SUMMARY
# ============================================================================

echo ""
info "========================================="
info "Rebranding Summary"
info "========================================="
if $DRY_RUN; then
    info "DRY RUN - No files were actually modified"
fi
info "Files that would be/were modified: $FILES_MODIFIED"
echo ""

if ! $DRY_RUN; then
    warn "IMPORTANT: Manual review required for:"
    warn "  1. src/fireots_server.cpp - datapack validation logic"
    warn "  2. CMakeLists.txt - verify all project names"
    warn "  3. GitHub Actions workflows (.github/workflows/*.yml)"
    warn "  4. vcpkg.json - package name"
    echo ""
    info "Next steps:"
    info "  1. Review changes: git diff"
    info "  2. Test build: ./recompile.sh ~/vcpkg linux-release"
    info "  3. Run tests: ctest --verbose"
    info "  4. Commit: git add -A && git commit -m 'Complete Fireots rebranding'"
else
    info "To apply changes, run: $0 (without --dry-run)"
fi

info "Rebranding process complete!"
