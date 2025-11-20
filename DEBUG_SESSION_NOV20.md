# Debug Session - November 20, 2025

## Problem Statement
Players cannot login to server after upstream merge from opentibiabr/canary.

## Investigation Timeline

### Initial Attempts (Failed)
1. ❌ Fixed deprecated API in `login.lua` (getPlayerGUID → player:getGuid())
2. ❌ Fixed migration 52 database errors (orphaned records)
3. ❌ Disabled all custom login scripts (minimal login.lua)
4. ❌ Rollback to Nov 18 pre-merge state
5. ❌ Rollback to Nov 15 (FireotsServer rename)
6. ❌ Rollback to Nov 14 (before all rebranding)

### Critical Discovery

Compared working `fireots_old/` (user-provided backup) with current code:

**Lua Scripts:** ✅ IDENTICAL
- `data-fire/scripts/creaturescripts/others/login.lua` - SAME
- `data-fire/lib/lib.lua` - SAME
- `data/core.lua` - SAME
- `data/global.lua` - SAME

**Migrations:** ❌ **MAJOR DIFFERENCE**
- `fireots_old`: Migrations 0-9 only
- Current main: Migrations 0-51
- **43 new migrations added during upstream merge**

**Conclusion:** Database schema changes from migrations 10-51 are incompatible with either:
- Old binary (pre-upstream-merge `src/`)
- Current Lua scripts
- Or both

## Root Cause Analysis

### Hypothesis 1: Migration-Induced Schema Break
Migrations 10-51 changed database schema in ways that:
- Break player authentication flow
- Cause silent crashes during login handler execution
- Are incompatible with old binary's expectations

### Hypothesis 2: Binary-Migration Mismatch
- Old binary expects schema version ≤9
- New migrations (10-51) require new binary features
- Running old binary with new schema → crashes

### Hypothesis 3: Specific Migration Bug
One migration between 10-51 introduced a breaking change:
- Dropped required column
- Changed data type incompatibly
- Broke foreign key relationship critical for login

## Evidence Supporting Root Cause

1. **Same binary, different data-fire → different results**
   - Old binary + fireots_old data-fire = ✅ LOGIN WORKS
   - Old binary + current data-fire = ❌ LOGIN FAILS

2. **No Lua script differences**
   - All `.lua` files identical between working and broken
   - Eliminates script bugs as cause

3. **43 migrations gap**
   - Large schema evolution between versions
   - High probability of breaking change

## Next Steps (Tomorrow)

### Option A: Rollback Migrations (Fast Test)
```bash
# 1. Remove migrations 10-51
cd data-fire/migrations
rm 10.lua 11.lua ... 51.lua

# 2. Reset database version
mysql -u fireots_user -p fireots
UPDATE `server_config` SET `value` = '9' WHERE `config` = 'db_version';

# 3. Restart server and test login
```

### Option B: Binary Recompilation (Proper Fix)
```bash
# Compile new binary from current src/ (post-upstream-merge)
cd /var/www/vhosts/fireots.pl/fireots
./recompile.sh ~/vcpkg linux-release

# This ensures binary matches migrations 10-51 expectations
```

### Option C: Incremental Migration Testing (Diagnostic)
```bash
# Test each migration 10-51 individually
for i in {10..51}; do
  # Apply migration $i
  # Test login
  # If breaks → found culprit
done
```

## Migration Files to Review

Priority migrations to inspect (likely breaking changes):

```bash
ls -la data-fire/migrations/{10..51}.lua
```

Look for:
- `ALTER TABLE players` - Changes to player table schema
- `DROP COLUMN` - Removed columns that login might need
- Foreign key changes on `accounts` or `players`
- Index changes affecting authentication queries

## Repository State

- **Current Branch:** `main` @ commit `4a9ef03bc`
- **Working Backup:** `fireots_old/` folder committed to repo
- **Comparison Available:** Can diff any file between versions

## Commands for Tomorrow

```bash
# Compare specific migration ranges
diff -u fireots_old/data-fire/migrations/9.lua data-fire/migrations/9.lua

# List all migration files
ls -1 data-fire/migrations/*.lua | nl

# Check database current version
mysql -u fireots_user -p -e "SELECT * FROM fireots.server_config WHERE config='db_version';"

# Safely rollback migrations
# (Backup database first!)
mysqldump -u fireots_user -p fireots > fireots_backup_$(date +%Y%m%d).sql
```

## Session Summary

**Time Spent:** ~4 hours debugging
**Commits Made:** 12 debugging commits (can be squashed later)
**Key Learning:** Problem is NOT in Lua scripts - it's database schema migrations
**Confidence Level:** 90% that migrations 10-51 are the root cause

---
**Next Session:** Test migration rollback hypothesis
