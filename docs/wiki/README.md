# Fireots Wiki - Getting Started

> **Quick Start Guide** - Get Fireots running in 30 minutes

This wiki provides user-facing documentation for getting started with Fireots, a clean, modular MMORPG server engine forked from Canary/OTServBR-Global.

---

## 📚 Wiki Contents

### For New Users

- **[Getting Started](Getting-Started.md)** - 30-minute quickstart guide
  - System requirements
  - Quick installation (Linux/Windows/macOS)
  - First server run
  - Connect with client

- **[Building from Source](Building-from-Source.md)** - Complete build instructions
  - Ubuntu/Debian setup
  - Windows (MSVC/MinGW)
  - macOS (Homebrew)
  - Docker deployment
  - Troubleshooting build errors

### For Server Administrators

- **[Datapack Guide](Datapack-Guide.md)** - Understanding `data-fire/`
  - Directory structure
  - Monster configuration
  - NPC scripting
  - Lua events and actions
  - Map files (OTBM)

- **Configuration Reference** *(coming soon)*
  - `config.lua` parameters
  - Database setup
  - Network configuration
  - Performance tuning

### For Migrators

- **[Migration from Canary](Migration-from-Canary.md)** - Switch from Canary to Fireots
  - Key differences
  - Datapack compatibility
  - Database migration
  - Breaking changes

- **[Migration from OTServBR](Migration-from-OTServBR.md)** - Upgrade from OTServBR-Global
  - Version mapping
  - Feature comparison
  - Migration scripts
  - Common pitfalls

---

## 🔧 Developer Documentation

For C++ development and API documentation, see:

- **[FIREOTS.md](../../FIREOTS.md)** - Comprehensive architecture guide
- **[Build Setup](../../BUILD_SETUP.md)** - Detailed build configuration
- **[Contributing](../../CONTRIBUTING.md)** - Contribution guidelines
- **API Documentation** - Generate with `./scripts/generate_docs.sh` (requires Doxygen)

---

## 🆘 Getting Help

### Common Issues

**Server won't start:**
1. Check `config.lua` - ensure `dataPackDirectory = "data-fire"`
2. Verify database connection in `config.lua`
3. Check logs in `logs/` directory
4. See [Building from Source](Building-from-Source.md#troubleshooting)

**Client can't connect:**
1. Verify `bindOnlyGlobalAddress = false` in `config.lua`
2. Check firewall settings (default port: 7172)
3. Ensure client protocol matches server version (13.x)

**Database errors:**
1. Run all migrations in `data-fire/migrations/`
2. Check schema version in `server_config` table
3. See [Database Schema Updates](../../schema.sql)

### Support Channels

- **GitHub Issues**: [tommycrusher/fireots/issues](https://github.com/tommycrusher/fireots/issues)
- **Discussions**: [tommycrusher/fireots/discussions](https://github.com/tommycrusher/fireots/discussions)
- **Documentation**: [FIREOTS.md](../../FIREOTS.md)

---

## 📖 External Resources

- **Official Gitbook**: [docs.fireots.pl](https://docs.fireots.pl/projects/fireots) *(coming soon)*
- **Upstream Canary**: [opentibiabr/canary](https://github.com/opentibiabr/canary)
- **OTClient (Mehah)**: [mehah/otclient](https://github.com/mehah/otclient)
- **Map Editor**: [Remere's Map Editor](https://github.com/opentibiabr/remeres-map-editor)

---

## 🚀 Quick Links

| Topic | Link |
|-------|------|
| 30-min setup | [Getting Started](Getting-Started.md) |
| Build from source | [Building from Source](Building-from-Source.md) |
| Datapack structure | [Datapack Guide](Datapack-Guide.md) |
| Switch from Canary | [Migration from Canary](Migration-from-Canary.md) |
| Architecture deep-dive | [FIREOTS.md](../../FIREOTS.md) |
| Roadmap & features | [ROADMAP.md](../../ROADMAP.md) |

---

**Last Updated**: November 16, 2025
**Wiki Version**: 1.0
**Server Version**: v1.5.0-rebrand+
