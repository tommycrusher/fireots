# Fireots - AI Coding Agent Instructions

## Project Overview
Fireots is a C++ MMORPG server emulator forked from Canary/OTServBR-Global, designed as a clean, modular engine for Tibia-like games. The project is **currently undergoing rebranding** from Canary to Fireots. Codebase follows modern C++20 patterns with dependency injection, Lua scripting, and multi-threaded ASIO networking.

**Active development branches:**
- `main` - Current Fireots fork (13 commits ahead, 623 commits behind opentibiabr/canary)
- Upstream tracking: `opentibiabr/canary` (source of ongoing improvements)

## Architecture

### Core Components
- **Game Engine** (`src/game/game.hpp`): Central singleton managing world state, players, creatures, and game loops
- **Map System** (`src/map/`): Handles world tiles, items, and spatial queries
- **Creatures** (`src/creatures/`): Player, Monster, NPC hierarchies with shared `Creature` base
- **Lua Integration** (`src/lua/`): Bidirectional binding between C++ and Lua for game scripts
- **Network Layer** (`src/server/`): ASIO-based protocol handlers for client connections
- **Database** (`src/database/`): MySQL integration via libmariadb

### Dependency Injection
Uses **boost::di** for IoC. Access singletons via:
- `inject<T>()` - Field injection for manual object creation
- `DI::get<T>()` - Get singleton reference from container
- `g_game()`, `g_logger()` - Legacy global accessors (wrappers around DI)

See `src/lib/di/README.md` for patterns. **Never use raw singletons** - always inject dependencies.

### Data Organization (Critical for Development)
**DO NOT MODIFY** `data/` - core Lua libraries shared across all datapacks:
- `data/` - Core framework: libs, events, scripts base (immutable)
- `data-fire/` - **Primary and only** supported datapack (monsters, scripts, world, migrations)
- Legacy datapacks archived in `archive/` for historical reference

**Consolidation complete**: `data-fire/` is the unified datapack. Legacy content archived.

Config file `config.lua` selects active datapack via `dataPackDirectory` (default: `"data-fire"`).

## Build System

### CMake Presets
Use CMake presets from `CMakePresets.json`:
```bash
# Linux release build
cmake --preset linux-release
cmake --build linux-release

# Linux debug with ASAN
cmake --preset linux-debug
cmake --build linux-debug

# Run tests
cmake --preset linux-test
cmake --build linux-test
ctest --verbose -R unit
```

### Quick Rebuild
Use `./recompile.sh [vcpkg_path] [preset]`:
```bash
./recompile.sh ~/vcpkg linux-release
```
This handles incremental builds and moves the executable to project root.

### Dependencies (vcpkg)
All deps in `vcpkg.json`: asio, pugixml, spdlog, luajit, libmariadb, parallel-hashmap, magic-enum, protobuf, boost-di. **Never add deps manually** - update `vcpkg.json`.

## Development Patterns

### C++ Conventions
- **Smart Pointers**: Use `std::shared_ptr<Player>`, `std::shared_ptr<Creature>` for entities
- **Headers**: `declarations.hpp` centralizes forward declarations; `pch.hpp` is precompiled header
- **Namespacing**: Avoid polluting global namespace; use anonymous namespaces in .cpp files
- **Error Handling**: Exceptions for initialization; return codes for runtime game logic

### Lua Scripting
Register C++ functions/classes in `src/lua/functions/`:
```cpp
registerMethod(L, "Player", "getLevel", luaPlayerGetLevel);
registerClass(L, "Item", "Container", newItem);
```

Lua entry points:
- `data/core.lua` - Loads core libraries
- `data/global.lua` - Global variables and datapack-specific setup
- Scripts in `data-fire/scripts/` organized by type (actions, creaturescripts, spells, etc.)

### Testing
- **Framework**: Boost::ut (macro-free, in `tests/`)
- **Mocking**: Use `DI::setTestContainer()` with `InMemoryLogger` for dependency injection in tests
- **Run**: `./build/linux-release/tests/unit/fireots_ut` or `ctest --verbose -R unit`
- See `tests/README.md` for suite structure and assertion patterns

## Rebranding Status (Canary → Fireots)

### Completed
- Repository forked to `tommycrusher/fireots`
- Documentation references updated (README, Gitbook)
- **Source file headers**: All `.cpp/.hpp` files updated to Fireots
- **Binary naming**: Executable renamed to `fireots`
- **Class naming**: `CanaryServer` → `FireotsServer`
- **CMake project**: Project renamed to `fireots` in CMakeLists.txt
- **Config validation**: Accepts `data-fire`, `data-canary`, and `data-otservbr-global`
- **Docker images**: Updated to fireots paths and binary names
- **Build scripts**: All scripts updated for fireots executable

### Completed (Icon & Branding)
- Icon redesign from canary to fireots branding ✅
  - New fire/phoenix themed icon (SVG source + multi-format outputs)
  - Comprehensive branding guidelines documented
  - Automated icon generation script created

### Future Work
- Logo and marketing materials (full logo with text, banners, social media assets)

**Rebranding Status**: Core rebranding complete including new icon. All references to Canary systematically updated while preserving GPL-2.0 license and attribution to original authors.

## Critical Workflows

### Running the Server
```bash
# First time setup
cp config.lua.dist config.lua
# Edit config.lua: set dataPackDirectory, database credentials, IP

# Start server (auto-restart on crash, logs to logs/)
./start_fire.sh ./fireots
```

### Database Migrations
Migrations in `data-fire/migrations/`. Apply manually via MySQL client - no auto-migration system.

### Adding Game Features
1. **C++ Logic**: Add to `src/game/` or relevant subsystem
2. **Lua API**: Expose via `src/lua/functions/` if scripts need access
3. **Game Scripts**: Implement in `data-fire/scripts/` (e.g., `actions/`, `spells/`)
4. **XML Config**: Update `data/items/items.xml` or `data-fire/monster/` as needed

### Debugging
- **GDB**: Use `./start_gdb.sh` for debug session
- **Logs**: Set `logLevel = "debug"` in `config.lua` for verbose output
- **ASAN**: Build with `linux-debug` preset to detect memory issues

## Common Pitfalls
- **Don't modify `data/` for game content** - use `data-fire/` or your custom datapack
- **Don't complete rebranding tasks** - coordinate with team before changing class names/headers
- **Always call `configure_python_environment`** before Python tools (if applicable)
- **Check `g_game().getGameState()`** before operations requiring running game loop
- **Lua errors are silent** - check server console for script load failures
- **Map edits require Remere's Map Editor** - don't hand-edit OTBM files

## Upstream Sync Strategy
Project is 623 commits behind opentibiabr/canary. Review upstream changes before backporting:
- Security fixes and critical bugs: **High priority**
- Performance improvements: **Medium priority**
- New game features: **Low priority** (evaluate fit for Fire's vision)
- Use selective cherry-picking rather than bulk merges to maintain fork independence

## Key Files Reference
- `src/canary_server.cpp` - Server initialization entry point
- `src/game/game.hpp` - Core game loop and world management
- `config.lua.dist` - Template for all server configuration
- `vcpkg.json` - External dependency manifest
- `CMakePresets.json` - Build configuration presets
