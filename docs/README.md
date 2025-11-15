# Fireots Documentation

This directory contains comprehensive documentation for the Fireots MMORPG server.

## 📚 Documentation Structure

### Wiki (`wiki/`)

User-facing documentation for getting started and using Fireots:

- **[Getting Started](wiki/Getting-Started.md)** - 30-minute quickstart guide
- **[Building from Source](wiki/Building-from-Source.md)** - Detailed build instructions for all platforms
- **Configuration Reference** *(coming soon)* - Complete config.lua reference
- **Troubleshooting** *(coming soon)* - Common issues and solutions
- **Migration Guides** *(coming soon)* - Migrating from Canary/OTServBR

### API Documentation (`doxygen/`)

Developer-focused API documentation generated from source code:

- **C++ API**: Class references, function signatures, dependencies
- **Lua Bindings**: Available Lua functions for scripting
- **Architecture**: System diagrams and component relationships

To generate API docs, run:
```bash
./scripts/generate_docs.sh
```

Then open `docs/doxygen/html/index.html` in your browser.

### Datapack Documentation *(coming soon)*

Guide for creating custom game content:

- `data-fire/` structure
- Script creation tutorials
- Monster and NPC definitions
- Quest system guide
- Item and spell creation

## 🔧 Generating Documentation

### Prerequisites

**For Doxygen (API docs):**
```bash
# Ubuntu/Debian
sudo apt-get install doxygen graphviz

# macOS
brew install doxygen graphviz

# Windows
choco install doxygen.install graphviz
```

### Generate API Documentation

```bash
cd /path/to/fireots
./scripts/generate_docs.sh
```

Output will be in `docs/doxygen/html/`.

### View Locally

**Option 1: Direct file open**
```bash
xdg-open docs/doxygen/html/index.html  # Linux
open docs/doxygen/html/index.html      # macOS
start docs/doxygen/html/index.html     # Windows
```

**Option 2: Local web server**
```bash
python3 -m http.server -d docs/doxygen/html 8000
# Visit http://localhost:8000
```

## 📖 Contributing to Documentation

We welcome documentation improvements! When contributing:

1. **Wiki pages**: Write in clear, beginner-friendly language
2. **Code documentation**: Use Doxygen-style comments
3. **Examples**: Include practical, working examples
4. **Screenshots**: Add when helpful (store in `docs/images/`)
5. **Formatting**: Follow existing Markdown style

### Doxygen Comment Style

```cpp
/**
 * @brief Brief description of the function
 *
 * Detailed description with usage notes and examples.
 * Can span multiple lines.
 *
 * @param player The player performing the action
 * @param item The item being used
 * @return true if action succeeded, false otherwise
 *
 * @throws std::runtime_error if player is invalid
 *
 * @example
 * auto result = useItem(player, item);
 * if (result) {
 *     player->sendTextMessage(MESSAGE_INFO_DESCR, "Item used!");
 * }
 */
bool useItem(std::shared_ptr<Player> player, std::shared_ptr<Item> item);
```

## 🌐 Documentation Hosting

### GitHub Wiki

Wiki pages can be synced to GitHub Wiki:
```bash
git clone https://github.com/tommycrusher/fireots.wiki.git
cp docs/wiki/*.md fireots.wiki/
cd fireots.wiki && git add . && git commit -m "Update wiki" && git push
```

### GitHub Pages

API documentation can be hosted on GitHub Pages:

1. Enable GitHub Pages in repository settings
2. Set source to `docs/doxygen/html`
3. Access at `https://tommycrusher.github.io/fireots/`

### Custom Domain (docs.fireots.pl)

For custom domain hosting:
1. Configure DNS CNAME to point to GitHub Pages
2. Add `CNAME` file with domain name to `docs/doxygen/html/`
3. Configure in GitHub repository settings

## 📋 Documentation Roadmap

Current status from [ROADMAP.md](../ROADMAP.md) Phase 1.2:

- [x] Create FIREOTS.md architecture guide
- [x] Getting Started wiki page
- [x] Building from Source wiki page
- [x] Doxygen configuration and generation script
- [ ] Configuration Reference wiki page
- [ ] Troubleshooting wiki page
- [ ] API documentation generation and hosting
- [ ] Datapack documentation guide
- [ ] Migration guides (Canary, OTServBR-Global)

## 🆘 Getting Help

- **Issues**: [GitHub Issues](https://github.com/tommycrusher/fireots/issues)
- **Discussions**: [GitHub Discussions](https://github.com/tommycrusher/fireots/discussions)
- **Wiki**: [Fireots Wiki](https://github.com/tommycrusher/fireots/wiki)

## 📄 License

Documentation is licensed under GPL-2.0, same as the Fireots project.

---

**Last Updated**: November 15, 2025
**Fireots Version**: 1.5.0-rebrand
