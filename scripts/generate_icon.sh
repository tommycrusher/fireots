#!/usr/bin/env bash
# Generate Fireots icons from SVG source

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SVG_SOURCE="$PROJECT_ROOT/cmake/fireots_icon.svg"
OUTPUT_DIR="$PROJECT_ROOT/docs/assets"

echo "🔥 Fireots Icon Generator"
echo "========================="
echo ""

# Check if SVG source exists
if [ ! -f "$SVG_SOURCE" ]; then
    echo "❌ Error: SVG source not found at $SVG_SOURCE"
    exit 1
fi

# Check for ImageMagick
if ! command -v convert &> /dev/null; then
    echo "❌ Error: ImageMagick not found"
    echo ""
    echo "Please install ImageMagick:"
    echo "  Ubuntu/Debian: sudo apt-get install imagemagick"
    echo "  macOS: brew install imagemagick"
    echo "  Arch: sudo pacman -S imagemagick"
    exit 1
fi

# Create output directory
mkdir -p "$OUTPUT_DIR"

echo "📁 SVG Source: $SVG_SOURCE"
echo "📂 Output Directory: $OUTPUT_DIR"
echo ""

# Generate Windows ICO (multi-resolution)
echo "🪟 Generating Windows ICO..."
convert "$SVG_SOURCE" \
    -define icon:auto-resize=64,48,32,16 \
    "$PROJECT_ROOT/cmake/fireots.ico"
echo "   ✓ Created: cmake/fireots.ico (16,32,48,64)"

# Generate PNG icons at various sizes
echo ""
echo "🖼️  Generating PNG icons..."

sizes=(16 32 48 64 128 256 512)
for size in "${sizes[@]}"; do
    output_file="$OUTPUT_DIR/fireots-icon-${size}.png"
    convert "$SVG_SOURCE" -resize ${size}x${size} "$output_file"
    echo "   ✓ Created: docs/assets/fireots-icon-${size}.png"
done

# Generate favicon.ico (for web)
echo ""
echo "🌐 Generating favicon.ico..."
convert "$SVG_SOURCE" \
    -define icon:auto-resize=32,16 \
    "$OUTPUT_DIR/favicon.ico"
echo "   ✓ Created: docs/assets/favicon.ico (16,32)"

# Generate macOS ICNS (if iconutil available - macOS only)
if command -v iconutil &> /dev/null; then
    echo ""
    echo "🍎 Generating macOS ICNS..."

    # Create temporary iconset
    ICONSET_DIR="$OUTPUT_DIR/fireots.iconset"
    mkdir -p "$ICONSET_DIR"

    # Generate required sizes for macOS
    convert "$SVG_SOURCE" -resize 16x16 "$ICONSET_DIR/icon_16x16.png"
    convert "$SVG_SOURCE" -resize 32x32 "$ICONSET_DIR/icon_16x16@2x.png"
    convert "$SVG_SOURCE" -resize 32x32 "$ICONSET_DIR/icon_32x32.png"
    convert "$SVG_SOURCE" -resize 64x64 "$ICONSET_DIR/icon_32x32@2x.png"
    convert "$SVG_SOURCE" -resize 128x128 "$ICONSET_DIR/icon_128x128.png"
    convert "$SVG_SOURCE" -resize 256x256 "$ICONSET_DIR/icon_128x128@2x.png"
    convert "$SVG_SOURCE" -resize 256x256 "$ICONSET_DIR/icon_256x256.png"
    convert "$SVG_SOURCE" -resize 512x512 "$ICONSET_DIR/icon_256x256@2x.png"
    convert "$SVG_SOURCE" -resize 512x512 "$ICONSET_DIR/icon_512x512.png"
    convert "$SVG_SOURCE" -resize 1024x1024 "$ICONSET_DIR/icon_512x512@2x.png"

    # Convert to ICNS
    iconutil -c icns "$ICONSET_DIR" -o "$OUTPUT_DIR/fireots.icns"
    rm -rf "$ICONSET_DIR"

    echo "   ✓ Created: docs/assets/fireots.icns"
else
    echo ""
    echo "ℹ️  Skipping macOS ICNS (iconutil not found - macOS only)"
fi

echo ""
echo "✅ Icon generation complete!"
echo ""
echo "Generated files:"
echo "  - cmake/fireots.ico (Windows executable)"
echo "  - docs/assets/fireots-icon-*.png (16, 32, 48, 64, 128, 256, 512)"
echo "  - docs/assets/favicon.ico (website)"
if command -v iconutil &> /dev/null; then
    echo "  - docs/assets/fireots.icns (macOS)"
fi
echo ""
echo "To use in Windows builds:"
echo "  1. Ensure cmake/fireots.rc references fireots.ico"
echo "  2. Rebuild project: cmake --build linux-release"
echo ""
echo "To use in documentation:"
echo "  <img src=\"docs/assets/fireots-icon-64.png\" alt=\"Fireots\">"
