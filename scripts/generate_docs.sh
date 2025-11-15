#!/bin/bash
# generate_docs.sh - Generate Doxygen API documentation for Fireots

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if doxygen is installed
if ! command -v doxygen &> /dev/null; then
    echo -e "${RED}Error: doxygen is not installed.${NC}"
    echo "Install it with:"
    echo "  Ubuntu/Debian: sudo apt-get install doxygen graphviz"
    echo "  macOS: brew install doxygen graphviz"
    echo "  Windows: choco install doxygen.install graphviz"
    exit 1
fi

# Check if graphviz/dot is installed (optional but recommended)
if ! command -v dot &> /dev/null; then
    echo -e "${YELLOW}Warning: graphviz (dot) is not installed.${NC}"
    echo "Graphs and diagrams will not be generated."
    echo "Install with:"
    echo "  Ubuntu/Debian: sudo apt-get install graphviz"
    echo "  macOS: brew install graphviz"
fi

echo -e "${GREEN}=== Fireots Doxygen Documentation Generator ===${NC}"
echo ""

# Create build directory if it doesn't exist
BUILD_DIR="build/docs"
mkdir -p "$BUILD_DIR"

# Create output directory
DOCS_OUTPUT="docs/doxygen"
mkdir -p "$DOCS_OUTPUT"

echo -e "${GREEN}Step 1: Configuring Doxygen...${NC}"

# Create Doxyfile from template
if [ -f "docs/Doxyfile.in" ]; then
    # Simple variable replacement
    sed "s|@CMAKE_CURRENT_BINARY_DIR@|$PWD/$BUILD_DIR|g" docs/Doxyfile.in > "$BUILD_DIR/Doxyfile"
    sed -i "s|\$(PROJECT_NUMBER)|1.5.0-rebrand|g" "$BUILD_DIR/Doxyfile"
    echo "  ✓ Doxyfile configured"
else
    echo -e "${RED}Error: docs/Doxyfile.in not found${NC}"
    exit 1
fi

echo -e "${GREEN}Step 2: Generating documentation...${NC}"

# Run doxygen
cd "$BUILD_DIR"
if doxygen Doxyfile; then
    echo -e "  ${GREEN}✓ Documentation generated successfully${NC}"
else
    echo -e "${RED}  ✗ Doxygen generation failed${NC}"
    exit 1
fi

cd ../..

echo -e "${GREEN}Step 3: Organizing output...${NC}"

# Move generated HTML to docs/doxygen
if [ -d "$BUILD_DIR/doc/source/html" ]; then
    rm -rf "$DOCS_OUTPUT/html"
    cp -r "$BUILD_DIR/doc/source/html" "$DOCS_OUTPUT/"
    echo "  ✓ HTML documentation copied to $DOCS_OUTPUT/html"
fi

# Move generated LaTeX if exists
if [ -d "$BUILD_DIR/doc/source/latex" ]; then
    rm -rf "$DOCS_OUTPUT/latex"
    cp -r "$BUILD_DIR/doc/source/latex" "$DOCS_OUTPUT/"
    echo "  ✓ LaTeX documentation copied to $DOCS_OUTPUT/latex"
fi

echo ""
echo -e "${GREEN}=== Documentation Generation Complete ===${NC}"
echo ""
echo "Output locations:"
echo "  HTML: $DOCS_OUTPUT/html/index.html"
if [ -d "$DOCS_OUTPUT/latex" ]; then
    echo "  LaTeX: $DOCS_OUTPUT/latex/"
fi
echo ""
echo "To view the documentation:"
echo "  xdg-open $DOCS_OUTPUT/html/index.html       # Linux"
echo "  open $DOCS_OUTPUT/html/index.html           # macOS"
echo "  start $DOCS_OUTPUT/html/index.html          # Windows"
echo ""
echo "To host locally:"
echo "  python3 -m http.server -d $DOCS_OUTPUT/html 8000"
echo "  Then visit: http://localhost:8000"
echo ""
