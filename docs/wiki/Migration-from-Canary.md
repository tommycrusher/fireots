# Migrating from Canary to Fireots

This guide helps you migrate an existing Canary server to Fireots.

## Overview

Fireots is a fork of Canary with rebranding and custom features. Most Canary configurations and datapacks are **compatible**, but some changes are required.

**Migration Difficulty**: ⭐⭐☆☆☆ (Easy)  
**Estimated Time**: 30-60 minutes  
**Data Loss Risk**: Low (with backups)

---

## Pre-Migration Checklist

- [ ] **Backup your database** (MySQL dump)
- [ ] **Backup your config.lua**
- [ ] **Backup your custom scripts** (if any)
- [ ] **Backup your world map** (.otbm file)
- [ ] **Note your Canary version** (check git tag/commit)

---

## Step 1: Build Fireots

### Clone and Build

```bash
# Clone Fireots
git clone https://github.com/tommycrusher/fireots.git
cd fireots

# Build using same method as Canary
cmake --preset linux-release
cmake --build linux-release

# Or use recompile script
./recompile.sh ~/vcpkg linux-release
```

**Expected Outcome**: `fireots` executable in project root

---

## Step 2: Configuration Migration

### config.lua Changes

| Canary Setting | Fireots Setting | Change Required? |
|----------------|-----------------|------------------|
| `serverName` | `serverName` | ✅ Update to your name |
| `dataPackDirectory` | `dataPackDirectory` | ⚠️ See below |
| Database settings | Database settings | ✅ Same as before |
| IP/Port | IP/Port | ✅ Same as before |

### Datapack Directory

Fireots uses `data-fire/` by default, but accepts Canary datapacks:

**Option A: Use Fireots datapack** (recommended)
```lua
dataPackDirectory = "data-fire"
```

**Option B: Use your existing Canary datapack**
```lua
dataPackDirectory = "data-canary"  -- Or your custom path
```

**Option C: Keep your custom datapack**
```lua
dataPackDirectory = "data-mycustompack"
```

### Full config.lua Comparison

**Canary config.lua**:
```lua
serverName = "My Canary Server"
dataPackDirectory = "data-otservbr-global"
mysqlHost = "127.0.0.1"
-- ... rest of config
```

**Fireots config.lua**:
```lua
serverName = "My Fireots Server"  -- Changed name
dataPackDirectory = "data-fire"    -- Changed datapack
mysqlHost = "127.0.0.1"            -- Same
-- ... rest of config (same)
```

### Copy Your Existing Config

```bash
# From your Canary directory
cp /path/to/canary/config.lua /path/to/fireots/config.lua

# Edit dataPackDirectory if using data-fire
nano config.lua
```

---

## Step 3: Database Migration

### No Schema Changes Required

Fireots uses the **same database schema** as Canary. Your existing database works as-is!

### Option A: Use Existing Database

In `config.lua`:
```lua
mysqlDatabase = "canary_db"  -- Your existing database name
mysqlUser = "canary_user"
mysqlPass = "your_password"
```

### Option B: Create New Database (Clean Start)

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

Import schema:
```bash
mysql -u fireots_user -p fireots_db < schema.sql
```

### Option C: Clone Existing Database

```bash
# Dump Canary database
mysqldump -u canary_user -p canary_db > backup.sql

# Import to new Fireots database
mysql -u fireots_user -p fireots_db < backup.sql
```

---

## Step 4: Datapack Migration

### Using data-canary (No Changes Needed)

If you're using the Canary datapack, just copy it:

```bash
# Copy your Canary datapack
cp -r /path/to/canary/data-otservbr-global /path/to/fireots/data-canary

# Configure in config.lua
dataPackDirectory = "data-canary"
```

### Migrating Custom Scripts to data-fire

If you have **custom scripts** in your Canary datapack:

```bash
# Copy custom scripts
cp -r /path/to/canary/data-custom/scripts/custom/* \
      /path/to/fireots/data-fire/scripts/custom/

# Copy custom monsters
cp -r /path/to/canary/data-custom/monster/custom/* \
      /path/to/fireots/data-fire/monster/custom/

# Copy custom NPCs
cp -r /path/to/canary/data-custom/npc/custom/* \
      /path/to/fireots/data-fire/npc/custom/
```

### Script Compatibility

**✅ Compatible** (no changes needed):
- Action scripts
- CreatureScripts
- TalkActions
- Movements
- GlobalEvents
- Spells
- Monster XML
- NPC XML

**⚠️ May need updates**:
- Scripts using `CanaryServer` class → Use `FireotsServer` instead
- Scripts checking server name → Update string comparisons

**Example fix**:
```lua
-- Canary
if getServerName() == "Canary" then

-- Fireots
if getServerName() == "Fireots" then
```

---

## Step 5: World Map Migration

### Copy Your Map

```bash
# Copy .otbm file
cp /path/to/canary/data-custom/world/myworld.otbm \
   /path/to/fireots/data-fire/world/myworld.otbm

# Update config.lua
mapName = "myworld"
```

### Map Compatibility

- **Same map format**: OTBM is unchanged
- **Same item IDs**: Items are compatible
- **Spawn files**: Copy along with map

```bash
# Copy spawn files
cp /path/to/canary/data-custom/world/myworld-spawn.xml \
   /path/to/fireots/data-fire/world/myworld-spawn.xml
```

---

## Step 6: First Launch

### Start Server

```bash
# Use start script
./start_fire.sh ./fireots

# Or run directly
./fireots
```

### Check for Errors

Watch console output for:
- ✅ "Server is online" - Success!
- ⚠️ Lua script errors - Check script paths
- ❌ Database connection failed - Check config.lua credentials

### Test Checklist

- [ ] Server starts without errors
- [ ] Can login with existing account
- [ ] Character data intact
- [ ] Custom scripts work
- [ ] Monsters spawn correctly
- [ ] NPCs respond
- [ ] Commands work (`/info`, `/online`)

---

## Common Migration Issues

### Issue: "Datapack not found"

**Symptom**: `[Error - Game::loadMainMap] Failed to load map`

**Solution**: Check `dataPackDirectory` in config.lua matches actual folder name

```bash
# Verify directory exists
ls -la data-fire/  # or data-canary/
```

### Issue: "Database connection failed"

**Symptom**: `[Error - Database] Failed to connect to database`

**Solution**: Verify MySQL credentials

```bash
# Test connection
mysql -u your_user -p your_database

# If fails, recreate user
mysql -u root -p
```

```sql
DROP USER 'old_user'@'localhost';
CREATE USER 'new_user'@'localhost' IDENTIFIED BY 'new_password';
GRANT ALL PRIVILEGES ON fireots_db.* TO 'new_user'@'localhost';
```

### Issue: "Lua script errors"

**Symptom**: `[Error - LuaInterface::loadFile] data-fire/scripts/...`

**Solution**: Check script paths

```bash
# Find script location
find data-fire/ -name "problematic_script.lua"

# Verify it's being loaded
grep -r "problematic_script" data-fire/scripts/
```

### Issue: "Items not appearing"

**Symptom**: Items in map show as parcels or disappear

**Solution**: Ensure `items.xml` compatibility

```bash
# Copy Canary items.xml if needed
cp /path/to/canary/data/items/items.xml data/items/items.xml
```

---

## Performance Comparison

Fireots maintains **same performance** as Canary:

| Metric | Canary | Fireots |
|--------|--------|---------|
| Player capacity | ~1000 | ~1000 |
| Memory usage | ~200MB base | ~200MB base |
| CPU usage | Low | Low |
| Startup time | ~5 sec | ~5 sec |

**Optimization tips** (same as Canary):
- Use `-DCMAKE_BUILD_TYPE=Release` for production
- Enable database caching in config.lua
- Use SSD for world map storage

---

## Rollback Plan

If migration fails, rollback to Canary:

```bash
# Stop Fireots
pkill fireots

# Restore database (if changed)
mysql -u root -p
```

```sql
DROP DATABASE fireots_db;
CREATE DATABASE canary_db;
```

```bash
mysql -u canary_user -p canary_db < backup.sql

# Restart Canary
cd /path/to/canary
./canary
```

---

## Advanced: Keeping Both Servers

Run Canary and Fireots side-by-side for testing:

### Separate Databases

**Canary**:
```lua
mysqlDatabase = "canary_db"
ipAddress = "127.0.0.1"
loginProtocolPort = 7171
gameProtocolPort = 7172
```

**Fireots**:
```lua
mysqlDatabase = "fireots_db"  -- Different database
ipAddress = "127.0.0.1"
loginProtocolPort = 7173      -- Different ports
gameProtocolPort = 7174
```

### Different Directories

```
/home/user/servers/
├── canary/
│   ├── canary (executable)
│   └── config.lua (ports 7171-7172)
└── fireots/
    ├── fireots (executable)
    └── config.lua (ports 7173-7174)
```

---

## Next Steps

After successful migration:

1. **Update documentation**: Note any custom changes
2. **Test thoroughly**: Run for 24-48 hours with test players
3. **Monitor logs**: Check `logs/` for unexpected errors
4. **Backup regularly**: Automate database dumps
5. **Explore Fireots features**: Check ROADMAP.md for upcoming features

---

## Getting Help

If you encounter issues:

- **GitHub Issues**: [Report bugs](https://github.com/tommycrusher/fireots/issues)
- **Discussions**: [Ask questions](https://github.com/tommycrusher/fireots/discussions)
- **Compare configs**: Use `diff` to compare Canary vs Fireots config

```bash
# Compare configurations
diff /path/to/canary/config.lua /path/to/fireots/config.lua
```

---

**Migration Completed?** 🎉

Your Canary server is now running on Fireots! Report any issues on GitHub.

---

**Last Updated**: November 15, 2025  
**Fireots Version**: 1.5.0-rebrand  
**Canary Compatibility**: v3.0+ (623 commits behind upstream)
