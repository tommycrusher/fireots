# Fireots - Comprehensive Project Documentation

**Version:** 1.4.1
**Last Updated:** November 14, 2025
**License:** GPL-2.0
**Repository:** https://github.com/tommycrusher/fireots

---

## Table of Contents
1. [Project Overview](#project-overview)
2. [Architecture](#architecture)
3. [Development Environment Setup](#development-environment-setup)
4. [Build System](#build-system)
5. [Code Organization](#code-organization)
6. [Dependency Injection Pattern](#dependency-injection-pattern)
7. [Lua Integration](#lua-integration)
8. [Database Schema](#database-schema)
9. [Networking](#networking)
10. [Testing Strategy](#testing-strategy)
11. [Datapack System](#datapack-system)
12. [Development Workflows](#development-workflows)
13. [Contributing Guidelines](#contributing-guidelines)
14. [Rebranding Roadmap](#rebranding-roadmap)

---

## Project Overview

### What is Fireots?

Fireots is a modern, high-performance C++ MMORPG server emulator designed for Tibia-like games. It's a fork of the Canary/OTServBR-Global project, reimagined as a clean, modular engine that prioritizes:

- **Modularity**: Clean separation between core engine (`data/`) and game content (`data-fire/`)
- **Performance**: Multi-threaded architecture with ASIO networking
- **Extensibility**: Comprehensive Lua scripting API for game logic
- **Modern C++**: Leverages C++20 features, dependency injection, and best practices

### Project Goals

1. **Clean Engine**: Provide a stable, well-documented server engine independent of specific game content
2. **Datapack Separation**: Maintain clear boundaries between core framework and game-specific data
3. **Active Development**: Selective backporting of valuable features from upstream Canary
4. **Community Focus**: Open-source development with emphasis on code quality and documentation

### Current Status

- **Commits ahead of upstream**: 13 (Fireots-specific improvements)
- **Commits behind upstream**: 623 (potential features to evaluate)
- **Active rebranding**: In progress from Canary to Fireots
- **Primary datapack**: `data-fire/` (consolidating `data-canary/`)

---

## Architecture

### High-Level Overview

```
┌─────────────────────────────────────────────────────────┐
│                    Client (Tibia/OTC)                   │
└────────────────────┬────────────────────────────────────┘
                     │ Protocol 13.x
                     ▼
┌─────────────────────────────────────────────────────────┐
│                   Network Layer (ASIO)                  │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  │
│  │ Login Server │  │ Game Server  │  │ Status Server│  │
│  └──────────────┘  └──────────────┘  └──────────────┘  │
└────────────────────┬────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────┐
│                     Game Engine                         │
│  ┌─────────────┐  ┌──────────────┐  ┌──────────────┐   │
│  │   Game      │  │     Map      │  │  Creatures   │   │
│  │  (g_game)   │  │  (tiles,     │  │  (players,   │   │
│  │             │  │   items)     │  │   monsters)  │   │
│  └─────────────┘  └──────────────┘  └──────────────┘   │
└────────────────────┬────────────────────────────────────┘
                     │
        ┌────────────┴────────────┐
        ▼                         ▼
┌──────────────┐          ┌──────────────┐
│  Lua Engine  │          │   Database   │
│  (scripts,   │          │   (MySQL)    │
│   events)    │          │              │
└──────────────┘          └──────────────┘
```

### Core Components

#### 1. Game Engine (`src/game/game.hpp`)
Central singleton responsible for:
- World state management
- Game loop execution (50ms ticks)
- Player/creature lifecycle
- Event scheduling and processing
- Rule enforcement

**Key Methods:**
- `Game::start()` - Initialize game world
- `Game::addPlayer()` - Register new player
- `Game::internalCreatureSay()` - Handle chat
- `Game::checkCreatures()` - Update creature states

#### 2. Map System (`src/map/`)
Handles spatial world representation:
- **Tile Management**: 3D grid system (x, y, z coordinates)
- **Item Placement**: Items on tiles, in containers
- **Pathfinding**: A* algorithm for creature movement
- **Loading**: OTBM format parsing

**Critical Files:**
- `map.hpp/cpp` - Main map class
- `tile.hpp/cpp` - Individual tile logic
- `spectators.hpp` - View radius queries

#### 3. Creature System (`src/creatures/`)
Object hierarchy for all entities:

```
Creature (abstract)
├── Player
│   ├── Inventory management
│   ├── Skills/stats
│   ├── Quest tracking
│   └── Account integration
├── Monster
│   ├── AI behavior
│   ├── Loot generation
│   └── Spawn management
└── Npc
    ├── Dialog system
    └── Shop management
```

**Smart Pointer Usage:**
All creatures use `std::shared_ptr<Creature>` for memory safety.

#### 4. Network Layer (`src/server/`)
ASIO-based asynchronous I/O:
- **ServiceManager**: Manages multiple service ports
- **Connection**: Per-client connection handler
- **Protocol**: Message parsing/serialization
  - `ProtocolLogin`: Authentication
  - `ProtocolGame`: In-game communication
  - `ProtocolStatus`: Server status queries

**Threading Model:**
- Main game thread for game logic
- Separate I/O threads for network operations
- Lock-free queues for inter-thread communication

#### 5. Lua Integration (`src/lua/`)
Bidirectional C++/Lua binding:
- **Registration**: `registerMethod()`, `registerClass()` in `src/lua/functions/`
- **Script Loading**: Organized by type (actions, spells, talkactions)
- **Event System**: Hooks into game events

**Example Registration:**
```cpp
// src/lua/functions/creatures/player/player_functions.cpp
registerMethod(L, "Player", "getLevel", luaPlayerGetLevel);
registerMethod(L, "Player", "addExperience", luaPlayerAddExperience);
```

#### 6. Database (`src/database/`)
MySQL integration via libmariadb:
- **Account Management**: Login credentials, characters
- **Player Data**: Inventory, skills, storage
- **World State**: Houses, guilds
- **Migrations**: Manual SQL scripts in `data-fire/migrations/`

---

## Development Environment Setup

### Prerequisites

**Linux (Ubuntu/Debian):**
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install git cmake build-essential autoconf libtool \
  ca-certificates curl zip unzip tar pkg-config ninja-build \
  ccache linux-headers-$(uname -r)
```

**macOS:**
```bash
brew install cmake ninja ccache git
```

**Windows:**
- Visual Studio 2022 with C++ Desktop Development
- CMake 3.22+
- Git for Windows

### vcpkg Setup

```bash
cd ~
git clone https://github.com/microsoft/vcpkg
cd vcpkg
./bootstrap-vcpkg.sh  # Linux/macOS
# OR
.\bootstrap-vcpkg.bat  # Windows

# Set environment variable
export VCPKG_ROOT=~/vcpkg  # Add to ~/.bashrc or ~/.zshrc
```

### Clone and Configure

```bash
git clone https://github.com/tommycrusher/fireots.git
cd fireots

# Copy and edit configuration
cp config.lua.dist config.lua
# Edit config.lua: set database credentials, IP, dataPackDirectory
```

---

## Build System

### CMake Presets

The project uses CMake presets defined in `CMakePresets.json`:

#### Linux Presets

**Release Build:**
```bash
cmake --preset linux-release
cmake --build linux-release
```

**Debug Build (with ASAN):**
```bash
cmake --preset linux-debug
cmake --build linux-debug
```

**Test Build:**
```bash
cmake --preset linux-test
cmake --build linux-test
ctest --verbose -R unit
```

#### Windows Presets

**Release Build:**
```bash
cmake --preset windows-release
cmake --build windows-release --config RelWithDebInfo
```

**Debug Build:**
```bash
cmake --preset windows-debug
cmake --build windows-debug --config Debug
```

### Quick Rebuild Script

Use the provided `recompile.sh` for incremental builds:

```bash
./recompile.sh ~/vcpkg linux-release
```

This script:
1. Detects system architecture (x86_64, ARM)
2. Configures CMake with vcpkg toolchain
3. Builds with progress reporting
4. Moves executable to project root
5. Backs up previous executable as `canary.old`

### Build Options

Key CMake variables (set via `-D` flag or presets):

| Variable | Default | Description |
|----------|---------|-------------|
| `BUILD_TESTS` | OFF | Enable test compilation |
| `OPTIONS_ENABLE_CCACHE` | OFF | Use ccache for compilation |
| `OPTIONS_ENABLE_IPO` | ON | Enable Link-Time Optimization |
| `FEATURE_METRICS` | OFF | Enable Prometheus metrics |
| `DEBUG_LOG` | OFF | Enable debug logging |
| `ASAN_ENABLED` | OFF | Enable AddressSanitizer |

### Executable Output

- **Linux**: `build/linux-release/bin/canary` (linked to `./canary`)
- **Windows**: `build/windows-release/bin/RelWithDebInfo/canary.exe`

---

## Code Organization

### Directory Structure

```
fireots/
├── src/                    # C++ source code
│   ├── account/            # Account management
│   ├── config/             # Configuration system
│   ├── creatures/          # Player, Monster, NPC
│   │   ├── players/
│   │   ├── monsters/
│   │   └── npcs/
│   ├── database/           # MySQL integration
│   ├── game/               # Game engine core
│   ├── io/                 # I/O operations (map loading, etc.)
│   ├── items/              # Item system
│   ├── kv/                 # Key-Value store
│   ├── lib/                # Utility libraries
│   │   ├── di/             # Dependency injection
│   │   ├── logging/        # Logger implementation
│   │   ├── messaging/      # Event/command bus
│   │   └── thread/         # Threading utilities
│   ├── lua/                # Lua integration
│   │   └── functions/      # Lua API bindings
│   ├── map/                # Map and tile system
│   ├── server/             # Network layer
│   ├── utils/              # General utilities
│   ├── canary_server.cpp   # Main server class
│   └── main.cpp            # Entry point
├── data/                   # Core Lua framework (DO NOT MODIFY)
│   ├── core.lua
│   ├── global.lua
│   ├── libs/               # Shared Lua libraries
│   ├── events/
│   ├── modules/
│   ├── scripts/            # Base script templates
│   └── XML/                # Core XML configs
├── data-fire/              # Fire-specific game content
│   ├── lib/                # Fire Lua extensions
│   ├── migrations/         # Database migrations
│   ├── monster/            # Monster definitions (XML)
│   ├── npc/                # NPC definitions (XML + Lua)
│   ├── scripts/            # Game scripts
│   │   ├── actions/
│   │   ├── creaturescripts/
│   │   ├── spells/
│   │   └── talkactions/
│   ├── startup/            # Startup configuration
│   └── world/              # Map files (OTBM)
├── data-canary/            # Legacy Canary content (merge target)
├── tests/                  # Unit and integration tests
│   ├── unit/
│   ├── integration/
│   └── fixture/            # Test utilities
├── docker/                 # Docker configuration
├── cmake/                  # CMake modules
└── vcpkg.json              # Dependency manifest
```

### Naming Conventions

**C++ Files:**
- Header files: `.hpp`
- Implementation: `.cpp`
- Precompiled header: `pch.hpp`
- Forward declarations: `declarations.hpp`

**C++ Code Style:**
- Classes: `PascalCase` (e.g., `FireotsServer`, `Player`)
- Methods: `camelCase` (e.g., `getLevel()`, `addExperience()`)
- Variables: `camelCase` (e.g., `playerName`, `itemCount`)
- Constants: `UPPER_SNAKE_CASE` (e.g., `MAX_PLAYERS`)
- Member variables: Often prefixed with `m_` (e.g., `m_name`)

**Lua Files:**
- Scripts: `snake_case.lua` (e.g., `demon_helmet.lua`)
- Libraries: `snake_case.lua` in `libs/`

---

## Dependency Injection Pattern

Fireots uses **Boost.DI** for dependency injection, eliminating traditional singleton antipatterns.

### Core Concepts

#### Container Setup
The DI container is initialized in `main.cpp`:
```cpp
auto injector = di::make_injector(
    di::bind<Logger>().to<LogWithSpdLog>(),
    di::bind<RSA>().to<RSA>(),
    // ... other bindings
);
```

#### Accessing Dependencies

**1. Field Injection** (for manually-created objects):
```cpp
class MyClass {
    Logger &logger = inject<Logger>();
    Game &game = inject<Game>();
};
```

**2. Container Access** (for singleton retrieval):
```cpp
DI::get<Logger>()  // Always returns same instance
DI::create<Player>()  // Creates new instance
```

**3. Legacy Globals** (wrappers around DI):
```cpp
g_logger()  // Equivalent to DI::get<Logger>()
g_game()    // Equivalent to DI::get<Game>()
```

### Testing with DI

Override dependencies in tests:
```cpp
suite<"my_test"> test = [] {
    di::extension::injector<> injector{};
    DI::setTestContainer(&InMemoryLogger::install(injector));

    auto &logger = dynamic_cast<InMemoryLogger&>(injector.create<Logger&>());

    // Test code using injected logger
    expect(eq(1, logger.logs.size()));
};
```

See `src/lib/di/README.md` for detailed patterns.

---

## Lua Integration

### Architecture

Fireots exposes C++ functionality to Lua via registration functions:

**Registration** (`src/lua/functions/`):
```cpp
void PlayerFunctions::init(lua_State* L) {
    registerClass(L, "Player", "", luaPlayerCreate);
    registerMethod(L, "Player", "getName", luaPlayerGetName);
    registerMethod(L, "Player", "getLevel", luaPlayerGetLevel);
}
```

**Usage in Lua** (`data-fire/scripts/`):
```lua
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local level = player:getLevel()
    if level < 50 then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "You need level 50.")
        return false
    end
    return true
end
```

### Script Types

| Type | Directory | Purpose | Example |
|------|-----------|---------|---------|
| **Actions** | `scripts/actions/` | Item usage | Using keys, levers |
| **CreatureScripts** | `scripts/creaturescripts/` | Creature events | onLogin, onDeath |
| **Spells** | `scripts/spells/` | Magic spells | Exori, Exura |
| **TalkActions** | `scripts/talkactions/` | Chat commands | !buyhouse, /t |
| **Movements** | `scripts/movements/` | Tile stepping | Teleports, traps |
| **GlobalEvents** | `scripts/globalevents/` | Server-wide | Daily rewards, respawn |

### Loading System

**Core loading** (`data/core.lua`):
```lua
DATA_DIRECTORY = configManager.getString(configKeys.DATA_DIRECTORY)
CORE_DIRECTORY = configManager.getString(configKeys.CORE_DIRECTORY)

dofile(CORE_DIRECTORY .. "/global.lua")
dofile(CORE_DIRECTORY .. "/libs/libs.lua")
```

**Datapack loading** (`data/global.lua`):
```lua
dofile(DATA_DIRECTORY .. "/lib/lib.lua")
local startupFile = io.open(DATA_DIRECTORY .. "/startup/startup.lua", "r")
if startupFile ~= nil then
    dofile(DATA_DIRECTORY .. "/startup/startup.lua")
end
```

### Best Practices

1. **Never modify `data/` scripts** - extend in `data-fire/lib/`
2. **Use `DATA_DIRECTORY` variable** for datapack-relative paths
3. **Register scripts in XML** before loading in Lua
4. **Error handling**: Lua errors are logged to console, not returned to client
5. **Performance**: Avoid creating Lua closures in hot paths

---

## Database Schema

### Connection Configuration

Set in `config.lua`:
```lua
-- Database
-- NOTE: Database encryption is optional, see: https://docs.opentibiabr.com/others/database#database-encryption
mysqlHost = "127.0.0.1"
mysqlUser = "root"
mysqlPass = ""
mysqlDatabase = "fireots"
mysqlPort = 3306
mysqlSock = ""
passwordType = "sha1"  -- or "plain"
```

### Schema Overview

**Core Tables:**
- `accounts` - Player accounts (email, password)
- `players` - Character data (name, level, vocation)
- `player_items` - Inventory and depot items
- `player_storage` - Quest/script storage values
- `houses` - House ownership and access
- `guilds` - Guild information
- `server_config` - Server-wide settings

### Migrations

Located in `data-fire/migrations/`, applied manually:

```bash
mysql -u root -p fireots < data-fire/migrations/1_initial_schema.sql
mysql -u root -p fireots < data-fire/migrations/2_add_prey_system.sql
```

**No automatic migration system** - track versions manually.

### ORM Pattern

No ORM used. Database access via raw SQL:
```cpp
// src/database/database.cpp
DBResult_ptr Database::storeQuery(const std::string& query) {
    // Execute query via MySQL C API
}
```

**Example**:
```cpp
auto result = Database::getInstance().storeQuery(
    fmt::format("SELECT `name` FROM `players` WHERE `id` = {}", playerId)
);
if (result) {
    std::string name = result->getString("name");
}
```

---

## Networking

### Protocol Stack

```
Application Layer:   Tibia Protocol 13.x
Transport Layer:     TCP
Network Library:     ASIO (Boost)
Encryption:          XTEA + RSA
Compression:         zlib (optional, level 0-9)
```

### Connection Flow

1. **Client connects** to login port (default: 7171)
2. **RSA encryption** of password
3. **Authentication** against database
4. **Character list** sent to client
5. **Client selects character**, connects to game port (7172)
6. **Game session** begins with protocol handshake

### Protocol Handlers

**ProtocolLogin** (`src/server/network/protocol/protocollogin.cpp`):
- Handles authentication
- Returns character list
- Validates client version

**ProtocolGame** (`src/server/network/protocol/protocolgame.cpp`):
- Parses game packets (movement, combat, chat)
- Sends world state updates
- Handles disconnections

### Message Parsing

```cpp
// Example: Parse player movement
void ProtocolGame::parseAutoWalk(NetworkMessage& msg) {
    uint8_t numdirs = msg.getByte();
    // Read direction bytes...
    addGameTask([=, this, playerID = player->getID(), dirs = std::move(path)]() {
        g_game().playerAutoWalk(playerID, dirs);
    });
}
```

### Threading Model

- **I/O Threads**: Handle async network I/O (ASIO thread pool)
- **Game Thread**: Single-threaded game loop (deterministic)
- **Task Queue**: Lock-free queue for dispatching network events to game thread

---

## Testing Strategy

### Framework: Boost.UT

Macro-free, header-only testing library:

```cpp
suite<"player"> playerTests = [] {
    "player creation"_test = [] {
        auto player = std::make_shared<Player>(nullptr);
        expect(player != nullptr);
        expect(eq(player->getLevel(), 1));
    };
};
```

### Test Organization

```
tests/
├── unit/                   # Unit tests (fast, isolated)
│   ├── creatures/
│   ├── items/
│   └── lua/
├── integration/            # Integration tests (slower, database)
│   └── database/
└── fixture/                # Test utilities
    ├── test_injection.hpp  # DI helpers
    └── account/
        └── in_memory_account_repository.hpp
```

### Running Tests

**Build tests:**
```bash
cmake --preset linux-test
cmake --build linux-test
```

**Run all tests:**
```bash
cd build/linux-test
ctest --verbose
```

**Run specific suite:**
```bash
ctest --verbose -R unit
ctest --verbose -R integration
```

**Direct execution:**
```bash
./build/linux-test/tests/unit/fireots_ut
```

### Mocking with DI

Override dependencies for tests:
```cpp
di::extension::injector<> injector{};
DI::setTestContainer(&InMemoryLogger::install(injector));

auto &logger = dynamic_cast<InMemoryLogger&>(injector.create<Logger&>());
// Test code...
expect(eq("error", logger.logs[0].level));
```

See `tests/README.md` for detailed patterns.

---

## Datapack System

### Philosophy

**Immutable Core** (`data/`):
- Shared Lua libraries and utilities
- Core event system
- Base XML schemas
- **Never modified** - updated only via upstream merges

**Mutable Content** (`data-fire/`):
- Game-specific monsters, NPCs, quests
- Custom Lua scripts
- World maps (OTBM files)
- Database migrations
- **Primary development target**

### Datapack Selection

In `config.lua`:
```lua
useAnyDatapackFolder = false
dataPackDirectory = "data-fire"  -- or "data-canary", "data-otservbr-global"
coreDirectory = "data"
```

**Validation** (in `src/canary_server.cpp`):
```cpp
if (!useAnyDatapack && (datapackName != "data-canary" &&
    datapackName != "data-otservbr-global")) {
    throw FailedToInitializeCanary("Invalid datapack name");
}
```

### Consolidation Plan

**Goal**: Merge `data-canary/` into `data-fire/` as single unified datapack.

**Challenges**:
- Duplicate monster/NPC definitions
- Conflicting quest IDs
- Different script organization

**Approach**:
1. Inventory differences between datapacks
2. Identify Fire-specific content to preserve
3. Merge non-conflicting content
4. Resolve conflicts case-by-case
5. Update validation logic to accept `data-fire` only

---

## Development Workflows

### Starting the Server

**First-time setup:**
```bash
# Create config from template
cp config.lua.dist config.lua

# Edit config.lua:
# - Set mysqlHost, mysqlUser, mysqlPass, mysqlDatabase
# - Set ip to your server's IP
# - Set dataPackDirectory to "data-fire"
# - Configure worldType ("pvp", "no-pvp", "pvp-enforced")

# Import database schema
mysql -u root -p fireots < schema.sql
```

**Run server** (with auto-restart):
```bash
./start_fire.sh ./canary
```

**Manual run**:
```bash
./canary
# Or for debugging:
./start_gdb.sh
```

**Logs**: Saved to `logs/` directory with timestamp

### Adding a New Game Feature

**Example: Custom spell**

1. **Create Lua script** (`data-fire/scripts/spells/custom_fireball.lua`):
```lua
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREATTACK)
combat:setArea(createCombatArea(AREA_CIRCLE2X2))

function onCastSpell(creature, variant)
    return combat:execute(creature, variant)
end
```

2. **Register in XML** (`data/spells/spells.xml` or `data-fire/spells/custom.xml`):
```xml
<instant name="Custom Fireball" words="exori custom"
         level="30" mana="50" soul="0"
         script="custom_fireball.lua">
    <vocation name="Sorcerer"/>
    <vocation name="Master Sorcerer"/>
</instant>
```

3. **Test in-game**: Relog and use spell

**Example: C++ feature (new item attribute)**

1. **Define enum** (`src/items/items_definitions.hpp`):
```cpp
enum ItemAttribute_t {
    ITEM_ATTRIBUTE_CUSTOM_POWER = 100,
    // ...
};
```

2. **Implement logic** (`src/items/item.cpp`):
```cpp
void Item::setCustomPower(uint32_t power) {
    setAttribute(ITEM_ATTRIBUTE_CUSTOM_POWER, power);
}
```

3. **Expose to Lua** (`src/lua/functions/items/item_functions.cpp`):
```cpp
registerMethod(L, "Item", "setCustomPower", luaItemSetCustomPower);
```

4. **Use in Lua scripts**

### Debugging

**GDB** (Linux):
```bash
./start_gdb.sh
# Inside GDB:
(gdb) break FireotsServer::run
(gdb) run
(gdb) backtrace
```

**Logging levels** (`config.lua`):
```lua
logLevel = "trace"  -- trace, debug, info, warning, error, critical, off
```

**AddressSanitizer** (detect memory issues):
```bash
cmake --preset linux-debug
cmake --build linux-debug
./build/linux-debug/bin/canary
```

**Common issues**:
- Lua script errors: Check console output, not returned to client
- Crashes on startup: Check database connection, map files
- Memory leaks: Use ASAN or Valgrind

---

## Contributing Guidelines

### Code Standards

**C++ Style:**
- Follow existing code style (spaces, bracing)
- Use `.clang-format` for automatic formatting
- Avoid `using namespace std;` in headers
- Prefer smart pointers over raw pointers
- Document complex algorithms

**Lua Style:**
- Use `luaformatter` for consistent formatting
- Follow naming: `snake_case` for files, `camelCase` for functions
- Comment non-obvious logic

### Pull Request Process

1. **Fork** the repository
2. **Create feature branch**: `git checkout -b feature/my-feature`
3. **Commit changes**: Clear, descriptive messages
4. **Test thoroughly**: Run unit tests, integration tests
5. **Update docs** if API changes
6. **Submit PR** with description of changes

**PR Guidelines:**
- Focus on single feature/fix per PR
- Don't include map changes (use forum/Discord)
- Explain *why* change is needed, not just *what*
- Be responsive to review comments

### Issue Reporting

**Bug reports** should include:
- Fireots version / commit hash
- Operating system and version
- Steps to reproduce
- Expected vs actual behavior
- Relevant logs/screenshots

**Feature requests** should include:
- Use case / problem being solved
- Proposed solution (optional)
- Willingness to implement (optional)

---

## Rebranding Roadmap

### Current State

Fireots is a fork of Canary with ongoing rebranding. **Do not complete rebranding tasks without coordination.**

### Completed

- ✅ Repository forked to `tommycrusher/fireots`
- ✅ README updated with Fireots branding
- ✅ Documentation references updated

### In Progress (DO NOT CHANGE WITHOUT REVIEW)

#### Source Code Headers
**Status**: All ~1000+ `.cpp/.hpp` files have Canary copyright headers

**Example current header**:
```cpp
/**
 * Canary - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/opentibiabr/canary
 * License: https://github.com/opentibiabr/canary/blob/main/LICENSE
 * Contributors: https://github.com/opentibiabr/canary/graphs/contributors
 * Website: https://docs.opentibiabr.com/
 */
```

**Proposed replacement**:
```cpp
/**
 * Fireots - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com> (Canary)
 * Copyright (©) 2024-2025 Fireots Team <contact@fireots.pl>
 * Repository: https://github.com/tommycrusher/fireots
 * License: https://github.com/tommycrusher/fireots/blob/main/LICENSE
 * Contributors: https://github.com/tommycrusher/fireots/graphs/contributors
 * Website: https://docs.fireots.pl/
 */
```

**Action**: Requires bulk find-replace script + legal review

#### Binary and Class Naming
| Item | Current | Target | Status |
|------|---------|--------|--------|
| Executable | `fireots` | `fireots` | ✅ Complete |
| Main class | `FireotsServer` | `FireotsServer` | ✅ Complete |
| Exception | `FailedToInitializeFireots` | `FailedToInitializeFireots` | ✅ Complete |

#### Configuration Validation
**File**: `src/fireots_server.cpp:330`

**Updated**:
```cpp
if (!useAnyDatapack && (datapackName != "data-fire" &&
    datapackName != "data-canary" && datapackName != "data-otservbr-global")) {
    throw FailedToInitializeFireots("Invalid datapack");
}
```

**Target**:
```cpp
if (!useAnyDatapack && datapackName != "data-fire") {
    throw FailedToInitializeFireots("Invalid datapack");
}
```

#### Docker Configuration
**Files**: `docker/Dockerfile.*`, `docker/docker-compose.yml`

**Current**: References `opentibiabr/canary` images

**Target**: Build custom `fireots/fireots` images

#### URLs and Links
**Locations**: README.md, CODE_OF_CONDUCT.md, source comments

**Current**:
- `https://docs.opentibiabr.com/`
- `opentibiabr@outlook.com`
- GitHub links to `opentibiabr/canary`

**Target**:
- `https://docs.fireots.pl/`
- `contact@fireots.pl`
- GitHub links to `tommycrusher/fireots`

### Rebranding Script (Proposed)

```bash
#!/bin/bash
# rebrand.sh - Systematic rebranding script (✅ COMPLETED)

# 1. Update source file headers (✅ Done)
find src/ tests/ -type f \( -name "*.cpp" -o -name "*.hpp" \) -exec sed -i 's/Canary - A free and open-source/Fireots - A free and open-source/' {} +

# 2. Rename main class (✅ Done)
sed -i 's/CanaryServer/FireotsServer/g' src/**/*.{cpp,hpp}
git mv src/canary_server.cpp src/fireots_server.cpp
git mv src/canary_server.hpp src/fireots_server.hpp

# 3. Update CMakeLists.txt (✅ Done)
sed -i 's/project(canary)/project(fireots)/' CMakeLists.txt
sed -i 's/canary-debug/fireots-debug/' CMakeLists.txt

# 4. Update scripts (✅ Done)
sed -i 's/canary/fireots/g' recompile.sh start_fire.sh start_gdb.sh fire-sh

# 5. Update Docker (✅ Done)
sed -i 's/canary/fireots/g' docker/Dockerfile.* docker/docker-compose.yml

# 6. Rename resource files (✅ Done)
git mv cmake/canary.rc cmake/fireots.rc
git mv cmake/canary.ico cmake/fireots.ico
```

**✅ Rebranding completed on branch feature/rebrand-fireots**

---

## Upstream Sync Strategy

### Current Status
- **13 commits ahead**: Fireots-specific changes
- **623 commits behind**: Potential features from opentibiabr/canary

### Evaluation Criteria

**High Priority** (backport ASAP):
- Security vulnerabilities
- Critical bug fixes
- Performance improvements (profiling-proven)
- Database schema fixes

**Medium Priority** (evaluate case-by-case):
- New game mechanics (if aligned with Fire vision)
- Refactoring improvements
- Test coverage additions

**Low Priority** (defer or reject):
- OTServBR-specific content
- Cosmetic changes
- Experimental features

### Sync Process

```bash
# Add upstream remote (one-time)
git remote add upstream https://github.com/opentibiabr/canary.git
git fetch upstream

# Review commits
git log HEAD..upstream/main --oneline

# Cherry-pick specific commit
git cherry-pick <commit-hash>

# Or merge range
git merge upstream/main
```

**Best Practice**: Selective cherry-picking over bulk merges to maintain fork independence.

---

## Additional Resources

### Documentation
- **Project Wiki**: https://github.com/tommycrusher/fireots/wiki
- **Gitbook**: https://docs.fireots.pl/projects/fireots
- **API Reference**: Generate with Doxygen (`docs/Doxyfile.in`)

### Community
- **Issues**: https://github.com/tommycrusher/fireots/issues
- **Pull Requests**: https://github.com/tommycrusher/fireots/pulls
- **Discord**: [Link when available]

### Related Projects
- **OTClient**: https://github.com/mehah/otclient (recommended client)
- **Remere's Map Editor**: https://github.com/opentibiabr/remeres-map-editor/
- **Tibia Client**: https://github.com/dudantas/tibia-client/releases

### License
This project is licensed under GPL-2.0. See [LICENSE](LICENSE) file.

**Attribution**: Fireots is derived from Canary/OTServBR-Global. All original copyright notices are preserved.

---

**Last Updated**: November 14, 2025
**Maintained By**: Fireots Team
**Questions**: Open an issue on GitHub
