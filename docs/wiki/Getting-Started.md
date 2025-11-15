# Getting Started with Fireots

Welcome to Fireots! This guide will help you set up and run your own Fireots MMORPG server in under 30 minutes.

## What is Fireots?

Fireots is a free and open-source MMORPG server emulator written in C++20, forked from the Canary project. It provides a complete server implementation compatible with Tibia 13.x clients, featuring:

- **Modern C++20** architecture with dependency injection
- **Lua scripting** for game logic and custom content
- **Multi-threaded networking** using ASIO
- **MySQL database** for persistence
- **Extensive game systems**: combat, spells, monsters, NPCs, quests, items, and more

## Prerequisites

Before you begin, ensure you have:

- **Operating System**: Linux (Ubuntu 22.04+ recommended), Windows 10/11, or macOS
- **RAM**: Minimum 2GB, recommended 4GB+
- **Disk Space**: ~2GB for source code, dependencies, and database
- **Internet Connection**: For downloading dependencies

### Required Software

#### Linux (Ubuntu/Debian)
```bash
sudo apt-get update
sudo apt-get install -y \
    git cmake ninja-build \
    build-essential pkg-config \
    libmariadb-dev mariadb-server
```

#### Windows
- [Visual Studio 2022](https://visualstudio.microsoft.com/) (Community Edition)
- [Git for Windows](https://git-scm.com/download/win)
- [CMake](https://cmake.org/download/)
- [vcpkg](https://github.com/microsoft/vcpkg) (see below)
- [MariaDB](https://mariadb.org/download/)

#### macOS
```bash
brew install git cmake ninja pkg-config mariadb
brew services start mariadb
```

## Quick Start (30-Minute Setup)

### Step 1: Install vcpkg (5 minutes)

vcpkg is used to manage C++ dependencies automatically.

**Linux/macOS:**
```bash
cd ~
git clone https://github.com/Microsoft/vcpkg.git
cd vcpkg
./bootstrap-vcpkg.sh
export VCPKG_ROOT=$HOME/vcpkg
```

**Windows (PowerShell):**
```powershell
cd C:\
git clone https://github.com/Microsoft/vcpkg.git
cd vcpkg
.\bootstrap-vcpkg.bat
$env:VCPKG_ROOT="C:\vcpkg"
```

### Step 2: Clone Fireots Repository (2 minutes)

```bash
git clone https://github.com/tommycrusher/fireots.git
cd fireots
```

### Step 3: Build Fireots (10-15 minutes)

The first build will take longer as vcpkg downloads and compiles dependencies.

**Linux:**
```bash
chmod +x recompile.sh
./recompile.sh ~/vcpkg linux-release
```

**Windows (Visual Studio Developer Command Prompt):**
```cmd
cmake --preset windows-release -DCMAKE_TOOLCHAIN_FILE=C:\vcpkg\scripts\buildsystems\vcpkg.cmake
cmake --build --preset windows-release
```

**macOS:**
```bash
chmod +x recompile.sh
./recompile.sh ~/vcpkg linux-release
```

After successful build, you'll find the `fireots` executable in the project root directory.

### Step 4: Setup Database (5 minutes)

1. **Create database and user:**

```bash
sudo mysql
```

```sql
CREATE DATABASE fireots;
CREATE USER 'fireots'@'localhost' IDENTIFIED BY 'your_password_here';
GRANT ALL PRIVILEGES ON fireots.* TO 'fireots'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

2. **Import database schema:**

```bash
mysql -u fireots -p fireots < schema.sql
```

### Step 5: Configure Server (3 minutes)

1. **Copy configuration template:**

```bash
cp config.lua.dist config.lua
```

2. **Edit `config.lua`** (minimum required changes):

```lua
-- MySQL connection
mysqlHost = "127.0.0.1"
mysqlUser = "fireots"
mysqlPass = "your_password_here"
mysqlDatabase = "fireots"

-- Server IP (use 127.0.0.1 for local testing)
ip = "127.0.0.1"

-- Datapack directory (use data-fire for Fireots-specific content)
dataPackDirectory = "data-fire"
```

3. **Optional**: Adjust other settings like rates, server name, MOTD, etc.

### Step 6: Start the Server (1 minute)

**Linux/macOS:**
```bash
./start_fire.sh
```

**Windows:**
```cmd
fireots.exe
```

**With auto-restart on crash:**
```bash
./start_fire.sh ./fireots
```

You should see output like:
```
>> Loading Fireots...
>> Loading FIREOTS 1.5.0-rebrand
>> Compiled with GNU C++ version 11.4.0
>> Compiled on Nov 15 2025 12:00:00
>> Loading RSA key...
>> Starting Database Manager...
>> Running Database Manager...
>> Loading lua environment...
>> Loaded all modules, server starting up...
>> Fireots Server Online!
```

### Step 7: Create Test Account (2 minutes)

Connect to your database and create a test account:

```sql
USE fireots;

-- Create account
INSERT INTO accounts (name, password, email) 
VALUES ('test', SHA1('test'), 'test@fireots.local');

-- Create player character
INSERT INTO players (name, account_id, level, vocation, health, healthmax, mana, manamax, cap, town_id, posx, posy, posz)
VALUES ('Test Player', LAST_INSERT_ID(), 8, 0, 185, 185, 90, 90, 470, 1, 95, 117, 7);
```

## Connect to Your Server

1. **Download a Tibia 13.x client** (compatible version)
2. **Edit the client's server list** to point to `127.0.0.1`
3. **Launch the client** and connect with:
   - Account: `test`
   - Password: `test`
   - Character: `Test Player`

## Next Steps

Now that your server is running:

- 📖 Read the [Configuration Reference](Configuration-Reference.md) for detailed settings
- 🎮 Learn about [Datapack Structure](Datapack-Structure.md) to create custom content
- 🔧 Check [Troubleshooting](Troubleshooting.md) if you encounter issues
- 🐛 See [Building from Source](Building-from-Source.md) for advanced build options
- 🚀 Explore the [Lua API Documentation](../doxygen/html/index.html) for scripting

## Common Issues

### "Failed to connect to MySQL"
- Ensure MariaDB is running: `sudo systemctl status mariadb`
- Check credentials in `config.lua`
- Verify database exists: `mysql -u fireots -p -e "SHOW DATABASES;"`

### "Port already in use"
- Another instance may be running: `ps aux | grep fireots`
- Change ports in `config.lua` (loginProtocolPort, gameProtocolPort)

### "Datapack not found"
- Ensure `dataPackDirectory = "data-fire"` in `config.lua`
- Verify `data-fire/` folder exists in project root

### Build fails with vcpkg errors
- Update vcpkg: `cd ~/vcpkg && git pull && ./bootstrap-vcpkg.sh`
- Clear vcpkg cache: `rm -rf ~/vcpkg/buildtrees ~/vcpkg/packages`
- Retry build

## Getting Help

- 📝 **Documentation**: [Fireots Wiki](https://github.com/tommycrusher/fireots/wiki)
- 🐛 **Bug Reports**: [GitHub Issues](https://github.com/tommycrusher/fireots/issues)
- 💬 **Discussions**: [GitHub Discussions](https://github.com/tommycrusher/fireots/discussions)
- 📧 **Contact**: Open an issue on GitHub

## License

Fireots is licensed under **GPL-2.0**. See [LICENSE](../../LICENSE) for details.

Based on [opentibiabr/canary](https://github.com/opentibiabr/canary) - credit to original authors.

---

**Estimated completion time**: 30 minutes  
**Last updated**: November 15, 2025  
**Fireots version**: 1.5.0-rebrand
