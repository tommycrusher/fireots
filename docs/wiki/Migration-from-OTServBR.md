# Migrating from OTServBR-Global to Fireots

This guide helps you migrate from OTServBR-Global to Fireots.

## Overview

Fireots is forked from **Canary**, which itself is a fork of **OTServBR-Global**. Most OTServBR configurations are compatible, but some modernization changes are required.

**Migration Difficulty**: ⭐⭐⭐☆☆ (Moderate)
**Estimated Time**: 1-2 hours
**Data Loss Risk**: Low (with backups)

---

## Pre-Migration Checklist

- [ ] **Backup your database** (MySQL dump)
- [ ] **Backup your config.lua**
- [ ] **Backup your custom scripts**
- [ ] **Backup your world map** (.otbm file)
- [ ] **Note your OTServBR version** (check git commit)
- [ ] **Document custom modifications**

---

## Key Differences: OTServBR vs Fireots

| Feature | OTServBR-Global | Fireots |
|---------|-----------------|---------|
| **C++ Standard** | C++17 | C++20 |
| **Dependency Injection** | Manual singletons | Boost::DI |
| **Executable Name** | `tfs` | `fireots` |
| **Config File** | `config.lua` | `config.lua` (same format) |
| **Database Schema** | OTServBR schema | Compatible (minor additions) |
| **Datapack Name** | `data-otservbr-global` | `data-fire` (or custom) |

---

## Step 1: Build Fireots

### System Requirements

**Same as OTServBR**, but with updated dependencies:

```bash
# Ubuntu/Debian
sudo apt-get install git cmake build-essential \
    libluajit-5.1-dev libmysqlclient-dev \
    libboost-system-dev libboost-iostreams-dev \
    libpugixml-dev libfmt-dev

# Install vcpkg (for modern dependencies)
git clone https://github.com/Microsoft/vcpkg.git ~/vcpkg
~/vcpkg/bootstrap-vcpkg.sh
```

### Build Process

```bash
# Clone Fireots
git clone https://github.com/tommycrusher/fireots.git
cd fireots

# Build
cmake --preset linux-release
cmake --build linux-release

# Or use provided script
./recompile.sh ~/vcpkg linux-release
```

**Build time**: ~5-10 minutes (depending on CPU)

---

## Step 2: Configuration Migration

### config.lua Changes

**OTServBR config.lua** → **Fireots config.lua**

#### Core Settings

```lua
-- OTServBR
serverName = "OTServBR-Global"
dataDirectory = "data-otservbr-global/"

-- Fireots
serverName = "My Fireots Server"  -- Change to your name
dataPackDirectory = "data-fire"   -- New setting name
```

#### Database Settings (Same)

```lua
-- No changes needed
mysqlHost = "127.0.0.1"
mysqlUser = "otserv"
mysqlPass = "password"
mysqlDatabase = "otservbr"
mysqlPort = 3306
```

#### Network Settings (Same)

```lua
-- No changes needed
ipAddress = "127.0.0.1"
loginProtocolPort = 7171
gameProtocolPort = 7172
```

#### New Settings in Fireots

```lua
-- Dependency injection (optional, defaults work)
useBoostDI = true

-- Enhanced logging (optional)
logLevel = "info"  -- debug, info, warning, error
```

### Automated Config Migration

```bash
# Copy your OTServBR config
cp /path/to/otservbr/config.lua /path/to/fireots/config.lua.old

# Compare with Fireots template
diff config.lua.old config.lua.dist

# Edit config.lua
nano config.lua
```

**Key changes to make**:
1. Update `serverName`
2. Change `dataDirectory` → `dataPackDirectory`
3. Remove trailing `/` from datapack path
4. Add new Fireots-specific settings (if any)

---

## Step 3: Database Migration

### Schema Compatibility

Fireots uses **compatible schema** with OTServBR, but may have additional tables/columns.

#### Option A: Use Existing Database (Recommended)

```lua
-- In config.lua
mysqlDatabase = "otservbr"  -- Your existing DB
mysqlUser = "otserv"
mysqlPass = "your_password"
```

Run Fireots migrations:
```bash
# Apply Fireots migrations (if any)
mysql -u otserv -p otservbr < data-fire/migrations/*.sql
```

#### Option B: Fresh Database with Data Import

```bash
# Create new database
mysql -u root -p
```

```sql
CREATE DATABASE fireots_db;
CREATE USER 'fireots_user'@'localhost' IDENTIFIED BY 'password123';
GRANT ALL PRIVILEGES ON fireots_db.* TO 'fireots_user'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

Import Fireots schema:
```bash
mysql -u fireots_user -p fireots_db < schema.sql
```

Migrate player data:
```bash
# Export OTServBR players
mysqldump -u otserv -p otservbr \
    accounts players player_deaths player_depotitems player_items \
    player_storage player_spells guilds guild_ranks > players_export.sql

# Import to Fireots
mysql -u fireots_user -p fireots_db < players_export.sql
```

#### Database Differences

Check for new columns:
```sql
-- Fireots may add new columns (example)
ALTER TABLE players ADD COLUMN `forge_dust` int(11) NOT NULL DEFAULT 0;
ALTER TABLE players ADD COLUMN `randomize_mount` tinyint(1) NOT NULL DEFAULT 0;
```

**Tip**: Compare schemas:
```bash
mysqldump -u otserv -p --no-data otservbr > otservbr_schema.sql
mysqldump -u fireots_user -p --no-data fireots_db > fireots_schema.sql
diff otservbr_schema.sql fireots_schema.sql
```

---

## Step 4: Datapack Migration

### Understanding Datapack Structure

**OTServBR**:
```
data-otservbr-global/
├── scripts/
├── monster/
├── npc/
└── world/
```

**Fireots**:
```
data/              # Core libraries (DO NOT MODIFY)
data-fire/         # Fireots datapack
data-canary/       # Canary compatibility
```

### Option A: Use data-fire (Recommended)

Start with Fireots datapack and copy your customizations:

```bash
# Copy custom scripts
cp -r /path/to/otservbr/data-otservbr-global/scripts/custom/* \
      /path/to/fireots/data-fire/scripts/custom/

# Copy custom monsters
cp -r /path/to/otservbr/data-otservbr-global/monster/custom/* \
      /path/to/fireots/data-fire/monster/custom/

# Copy custom NPCs
cp -r /path/to/otservbr/data-otservbr-global/npc/custom/* \
      /path/to/fireots/data-fire/npc/custom/
```

Update config.lua:
```lua
dataPackDirectory = "data-fire"
```

### Option B: Use OTServBR Datapack Directly

Keep your entire OTServBR datapack:

```bash
# Copy entire datapack
cp -r /path/to/otservbr/data-otservbr-global \
      /path/to/fireots/data-otservbr-global

# Configure
dataPackDirectory = "data-otservbr-global"
```

**Note**: This is supported but not recommended long-term. Migrate to data-fire gradually.

### Script Compatibility

**✅ Compatible** (no changes):
- Action scripts (99% compatible)
- TalkActions
- Movements
- GlobalEvents
- Basic CreatureScripts

**⚠️ May need updates**:
- Scripts using new C++20 features
- Scripts depending on OTServBR-specific globals
- Event callbacks (new system in Fireots)

**❌ Incompatible**:
- Scripts using removed/deprecated functions
- Hard-coded paths to `data-otservbr-global/`

### Fixing Common Script Issues

#### Issue: Hard-coded datapack paths

```lua
-- OTServBR (bad)
dofile("data-otservbr-global/lib/mylib.lua")

-- Fireots (good)
dofile(DATA_DIRECTORY .. "/lib/mylib.lua")
```

#### Issue: Deprecated functions

Check `docs/DEPRECATIONS.md` for removed functions:

```lua
-- Old OTServBR
getPlayerGUID(cid)

-- New Fireots
Player(cid):getGuid()
```

#### Issue: Global variables

```lua
-- OTServBR uses some globals
if SERVER_NAME == "OTServBR" then

-- Fireots - use config
if configManager.getString(configKeys.SERVER_NAME) == "Fireots" then
```

---

## Step 5: World Map Migration

### Map Format

**Same format**: OTBM is compatible between OTServBR and Fireots.

```bash
# Copy map file
cp /path/to/otservbr/data-otservbr-global/world/otservbr.otbm \
   /path/to/fireots/data-fire/world/myworld.otbm

# Copy spawn files
cp /path/to/otservbr/data-otservbr-global/world/otservbr-spawn.xml \
   /path/to/fireots/data-fire/world/myworld-spawn.xml

# Copy house files (if separate)
cp /path/to/otservbr/data-otservbr-global/world/otservbr-house.xml \
   /path/to/fireots/data-fire/world/myworld-house.xml
```

Update config.lua:
```lua
mapName = "myworld"
mapAuthor = "Your Name"
```

### Map Compatibility Check

**Item IDs**: Same as OTServBR (based on items.xml)
**Tile flags**: Compatible
**Waypoints**: Compatible

**Potential issues**:
- Custom items (check items.xml includes them)
- Modified spawn format (rare)

---

## Step 6: Testing Migration

### First Launch

```bash
# Start server
./start_fire.sh ./fireots

# Watch for errors
tail -f logs/fireots.log
```

### Test Checklist

- [ ] Server starts without errors
- [ ] Database connection succeeds
- [ ] Map loads correctly
- [ ] Can create account
- [ ] Can create character
- [ ] Can login with character
- [ ] Movement works
- [ ] Combat works
- [ ] Monsters spawn
- [ ] NPCs respond
- [ ] Custom scripts execute
- [ ] Items display correctly
- [ ] Quests functional

### Common Startup Errors

#### Error: "Failed to load map"

**Cause**: Map file not found or corrupted

**Solution**:
```bash
# Check map path
ls -la data-fire/world/*.otbm

# Verify config.lua
grep mapName config.lua
```

#### Error: "Database connection failed"

**Cause**: Wrong credentials or MySQL not running

**Solution**:
```bash
# Check MySQL status
sudo systemctl status mysql

# Test connection
mysql -u fireots_user -p fireots_db

# Verify config.lua credentials
```

#### Error: "Lua script failed to load"

**Cause**: Script syntax error or missing dependency

**Solution**:
```bash
# Check error log
cat logs/fireots.log | grep "Error - Lua"

# Test Lua syntax
luac -p data-fire/scripts/problematic_script.lua
```

---

## Step 7: Post-Migration Optimization

### Update Deprecated Code

Search for OTServBR-specific code:

```bash
# Find deprecated function calls
grep -r "doPlayerAddItem" data-fire/scripts/

# Find hard-coded paths
grep -r "data-otservbr-global" data-fire/
```

### Modernize Scripts

Use new Fireots features:

```lua
-- Old OTServBR style
function onUse(cid, item, fromPosition, itemEx, toPosition)
    local player = Player(cid)
    if not player then
        return false
    end
    -- ...
end

-- New Fireots style (same, but cleaner with DI)
local action = Action()

function action.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then
        return false
    end
    -- ...
end

action:id(2160)
action:register()
```

### Performance Tuning

Fireots benefits from same optimizations as OTServBR:

```lua
-- config.lua
rateExp = 5
rateSkill = 3
housePriceEachSQM = 1000
houseRentPeriod = "never"  -- Or "weekly"
```

---

## Known Migration Issues

### Issue: Players cannot login

**Symptom**: "Account name or password is incorrect"

**Cause**: Password encryption differences

**Solution**: Reset passwords or migrate accounts:
```sql
-- Check password column
SELECT id, name, password FROM accounts LIMIT 5;

-- If needed, reset password (plain text, change in-game)
UPDATE accounts SET password = SHA1('newpassword') WHERE id = 1;
```

### Issue: Items missing from depot

**Symptom**: Player depot empty after migration

**Cause**: Item ID mismatches

**Solution**: Check items.xml compatibility
```bash
diff /path/to/otservbr/data/items/items.xml data/items/items.xml
```

### Issue: Quests not working

**Symptom**: Quest chests empty, NPCs not responding

**Cause**: Storage value differences

**Solution**: Check quest storage IDs
```lua
-- OTServBR might use different storage ranges
-- Fireots: See data-fire/lib/quests/quest_ids.lua
```

---

## Rollback Plan

If migration fails:

```bash
# Stop Fireots
pkill fireots

# Restore database
mysql -u root -p
```

```sql
DROP DATABASE fireots_db;  -- If you created new DB
```

```bash
mysql -u otserv -p otservbr < backup.sql

# Restart OTServBR
cd /path/to/otservbr
./tfs
```

---

## Gradual Migration Strategy

**Recommended for large servers**: Run both in parallel

### Week 1-2: Testing
- Run Fireots on test server
- Test with staff accounts
- Validate custom scripts

### Week 3-4: Beta
- Open to select players
- Gather feedback
- Fix issues

### Week 5+: Full Migration
- Announce migration date
- Final database backup
- Switch DNS/IP to Fireots
- Monitor for 48 hours

---

## Getting Help

**Resources**:
- [Fireots GitHub Issues](https://github.com/tommycrusher/fireots/issues)
- [Fireots Discussions](https://github.com/tommycrusher/fireots/discussions)
- [OTServBR Discord](https://discord.gg/otservbr) - Ask about Canary/Fireots migration

**Provide when asking for help**:
- Fireots version (`git describe --tags`)
- OTServBR version (commit hash)
- Error logs (`logs/fireots.log`)
- config.lua (sanitized - no passwords!)

---

## Migration Complete! 🎉

Your OTServBR server is now running on Fireots.

**Next steps**:
1. Update documentation for players
2. Test all custom features thoroughly
3. Monitor server performance
4. Join Fireots community for updates

---

**Last Updated**: November 15, 2025
**Fireots Version**: 1.5.0-rebrand
**OTServBR Compatibility**: Based on Canary fork (upstream tracking)
