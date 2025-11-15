# Fireots Branding Guidelines

**Version**: 1.0
**Last Updated**: November 15, 2025

---

## Overview

This document defines the visual identity and branding standards for Fireots.

**Core Theme**: **Fire, Phoenix, Rebirth**

Fireots emerged from Canary as a reborn project with focus on:
- Modern C++20 architecture
- Clean, modular design
- Community-driven development

---

## Color Palette

### Primary Colors

| Color | Hex | RGB | Usage |
|-------|-----|-----|-------|
| **Fire Orange** | `#FF6600` | `255, 102, 0` | Primary accent, logos |
| **Ember Red** | `#FF3300` | `255, 51, 0` | Secondary accent, highlights |
| **Deep Red** | `#CC0000` | `204, 0, 0` | Dark accents, shadows |
| **Flame Yellow** | `#FFAA00` | `255, 170, 0` | Highlights, tips |

### Neutral Colors

| Color | Hex | RGB | Usage |
|-------|-----|-----|-------|
| **Dark Gray** | `#1A1A1A` | `26, 26, 26` | Backgrounds |
| **Medium Gray** | `#333333` | `51, 51, 51` | Borders, outlines |
| **Light Gray** | `#CCCCCC` | `204, 204, 204` | Text on dark |
| **White** | `#FFFFFF` | `255, 255, 255` | Text, icons |

---

## Logo Design

### Icon (64x64 .ico)

**File**: `cmake/fireots.ico`

**Design Elements**:
- Majestic phoenix with outstretched wings in flight
- Central sun/moon orb providing dramatic backlight
- Left wing: Orange gradient (symbolizing rebirth, energy)
- Right wing: Red gradient (symbolizing power, passion)
- Detailed feather layers for depth and realism
- Rising flames from tail feathers
- Scattered ember particles and sparkles throughout
- Dark purple/navy background for dramatic contrast
- Golden yellow sun with radial gradient

**Formats**:
- Primary: SVG (`cmake/fireots_icon.svg`)
- Windows: ICO (`cmake/fireots.ico`) - 16x16, 32x32, 48x48, 64x64
- Web: PNG (`docs/assets/fireots-icon-*.png`)

### Logo Variants

#### Standard Logo
- **Usage**: Documentation headers, GitHub README
- **Size**: 512x512 minimum
- **Format**: PNG with transparent background

#### Monochrome Logo
- **Usage**: Favicons, small icons
- **Colors**: Black/white only

#### Horizontal Logo
- **Usage**: Banners, headers
- **Format**: Text "Fireots" + icon
- **Ratio**: 3:1 (width:height)

---

## Typography

### Primary Font
**Heading**: **Roboto Bold** or **Source Sans Pro Bold**
- Modern, clean, readable
- Used for: Documentation titles, UI headers

### Monospace Font
**Code**: **JetBrains Mono** or **Fira Code**
- Used for: Code snippets, terminal output

### Sizes
- H1: 32pt
- H2: 24pt
- H3: 18pt
- Body: 14pt
- Code: 12pt

---

## Icon Design Specifications

### Sizes Required

| Size | Usage | File Format |
|------|-------|-------------|
| 16x16 | Favicon, taskbar (small) | ICO, PNG |
| 32x32 | Favicon, taskbar (medium) | ICO, PNG |
| 48x48 | Application list | ICO, PNG |
| 64x64 | Application icon | ICO, PNG |
| 128x128 | High-DPI displays | PNG |
| 256x256 | macOS, Linux | PNG, ICNS |
| 512x512 | Website, GitHub | PNG, SVG |

### Design Principles

1. **Simplicity**: Recognizable at 16x16
2. **Consistency**: Maintain theme across sizes
3. **Contrast**: Clear on light and dark backgrounds
4. **Scalability**: Use vector source (SVG)

---

## Creating the Icon

### From SVG to ICO (Linux/macOS)

```bash
# Install ImageMagick
sudo apt-get install imagemagick  # Ubuntu/Debian
brew install imagemagick          # macOS

# Convert SVG to multi-resolution ICO
cd cmake/
convert fireots_icon.svg -define icon:auto-resize=64,48,32,16 fireots.ico
```

### From SVG to PNG

```bash
# Generate multiple sizes
for size in 16 32 48 64 128 256 512; do
  convert fireots_icon.svg -resize ${size}x${size} fireots-icon-${size}.png
done
```

### Online Tools (Alternative)

If ImageMagick unavailable:
1. **Inkscape**: Export SVG to PNG at different sizes
2. **ConvertICO**: https://convertico.com/ (SVG → ICO)
3. **RealFaviconGenerator**: https://realfavicongenerator.net/

---

## Usage Guidelines

### DO

✅ Use official color palette
✅ Maintain aspect ratio
✅ Provide clear space around logo (minimum 10% of logo height)
✅ Use on contrasting backgrounds
✅ Link to Fireots website/repo when using logo

### DON'T

❌ Distort or skew the logo
❌ Change colors outside palette
❌ Add effects (drop shadow, glow) unless approved
❌ Use low-resolution versions
❌ Imply official endorsement without permission

---

## File Locations

### Source Files
- `cmake/fireots_icon.svg` - Master SVG source
- `docs/assets/fireots-logo.svg` - Full logo with text

### Generated Files
- `cmake/fireots.ico` - Windows executable icon
- `docs/assets/fireots-icon-*.png` - Web/documentation icons

### Future Additions
- `docs/assets/fireots-banner.png` - GitHub banner (1280x640)
- `docs/assets/fireots-social.png` - Social media (1200x630)
- `docs/assets/favicon.ico` - Website favicon

---

## Brand Voice

### Personality
- **Professional**: Serious about code quality
- **Friendly**: Welcoming to contributors
- **Innovative**: Embracing modern C++20
- **Community-driven**: Listening to feedback

### Messaging
- **Tagline**: "Reborn from Canary. Built for the future."
- **Mission**: Modern, modular MMORPG server emulator
- **Values**: Quality, Performance, Community

---

## Examples

### README.md Header
```markdown
<div align="center">
  <img src="docs/assets/fireots-logo.svg" alt="Fireots" width="300">
  <h1>Fireots</h1>
  <p><em>Reborn from Canary. Built for the future.</em></p>
</div>
```

### Documentation Site
```html
<link rel="icon" type="image/x-icon" href="/favicon.ico">
<link rel="icon" type="image/png" sizes="32x32" href="/fireots-icon-32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/fireots-icon-16.png">
```

---

## Attribution

Icon design inspired by:
- Phoenix mythology (rebirth, fire)
- Open Tibia community heritage
- Modern flat design principles

**Designer**: Fireots Community
**License**: GPL-2.0 (same as codebase)

---

## Updating Branding

To propose changes to branding:

1. Open GitHub issue with `[Branding]` tag
2. Provide mockups or examples
3. Discuss with community
4. Update this document if approved

**Contact**: [GitHub Discussions](https://github.com/tommycrusher/fireots/discussions)

---

**Next Steps**:
- [ ] Finalize icon design (community vote)
- [ ] Create full logo with "Fireots" text
- [ ] Design GitHub banner
- [ ] Create social media assets
