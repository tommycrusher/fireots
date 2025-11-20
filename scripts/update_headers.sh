#!/bin/bash
# update_headers.sh - Update file headers from Canary to Fireots
# This preserves attribution while establishing Fireots identity

set -euo pipefail

GREEN='\033[0;32m'
NC='\033[0m'

info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

COUNT=0

info "Updating source file headers..."

# Find all C++ source files
find src/ tests/ -type f \( -name "*.cpp" -o -name "*.hpp" \) | while read -r file; do
    # Step 1: Replace "Canary - A free and open-source" with "Fireots - A free and open-source"
    if grep -q "Canary - A free and open-source MMORPG server emulator" "$file"; then
        sed -i 's/Canary - A free and open-source MMORPG server emulator/Fireots - A free and open-source MMORPG server emulator/' "$file"
        ((COUNT++)) || true
    fi

    # Step 2: Update repository URL
    if grep -q "Repository: https://github.com/opentibiabr/canary" "$file"; then
        sed -i 's|Repository: https://github.com/opentibiabr/canary|Repository: https://github.com/tommycrusher/fireots|' "$file"
    fi

    # Step 3: Update license URL
    if grep -q "License: https://github.com/opentibiabr/canary/blob/main/LICENSE" "$file"; then
        sed -i 's|License: https://github.com/opentibiabr/canary/blob/main/LICENSE|License: https://github.com/tommycrusher/fireots/blob/main/LICENSE|' "$file"
    fi

    # Step 4: Update contributors URL
    if grep -q "Contributors: https://github.com/opentibiabr/canary/graphs/contributors" "$file"; then
        sed -i 's|Contributors: https://github.com/opentibiabr/canary/graphs/contributors|Contributors: https://github.com/tommycrusher/fireots/graphs/contributors|' "$file"
    fi

    # Step 5: Update website URL
    if grep -q "Website: https://docs.opentibiabr.com/" "$file"; then
        sed -i 's|Website: https://docs.opentibiabr.com/|Website: https://docs.fireots.pl/|' "$file"
    fi
done

info "Updated headers in $COUNT files"
info "Done!"
