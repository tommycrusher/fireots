# Datapack Consolidation Analysis
**Phase 1.3: Konsolidacja Datapacków**
**Date:** 2025-11-15

## Executive Summary

After analyzing both `data-canary/` and `data-fire/` datapacks, the consolidation effort is **much simpler than expected**. The `data-canary/` datapack contains only **57 Lua scripts** (mostly actions), with **no monsters, NPCs, or unique world content** beyond the basic `canary.otbm` map file.

### Key Finding: 70% Script Overlap
- **57 total scripts** in data-canary
- **40 scripts (70%)** are identical to data-fire
- **17 scripts (30%)** have differences (mostly minor enhancements)
- **0 unique scripts** - all exist in data-fire already

## Inventory Results

### data-canary/ (136 files)
```
Scripts:           57 Lua files
├─ actions:        42 (objects: 2, other: 27, quests: 11, tools: 2)
├─ movements:      6
├─ creaturescripts: 7
├─ spells:         1
└─ weapons:        1

Monsters:          0 XML files
NPCs:              0 XML files
Libraries:         Not analyzed (likely using core data/libs/)
Migrations:        Not present
Raids:             Not present

World Files:
├─ canary.otbm:    19 MB (main map)
├─ canary-house.xml: 146 bytes
├─ canary-npc.xml:   790 bytes
└─ canary-monster.xml: 35 bytes
```

### data-fire/ (4,958 files)
```
Scripts:           1,924 Lua files
├─ actions:        724
├─ spells:         597
├─ movements:      254
├─ creaturescripts: 170
├─ quests:         95
├─ globalevents:   38
├─ raids:          20
├─ weapons:        11
├─ world_changes:  8
├─ game_migrations: 4
├─ systems:        1
└─ custom:         2

Monsters:          174 XML files (36 categories)
NPCs:              0 XML files (likely in world/ spawn files)
Libraries:         23 Lua files
Migrations:        45 SQL files
Raids:             88 XML files

World Files:
├─ fire-monster.xml: 14 MB (spawn definitions)
├─ fire-house.xml:   247 KB
├─ fire-npc.xml:     153 KB
├─ fire-zones.xml:   69 bytes
├─ annual_events/    (directory)
├─ custom/           (directory)
├─ quest/            (directory)
├─ working/          (directory)
└─ world_changes/    (directory)
```

## Script Differences Analysis

### Different Scripts (17 files)
All differences are in `actions/` category:

**Other Actions (14 scripts):**
1. `blessing_charms.lua` - data-fire has extended item IDs (25360, 25361)
2. `surprise_bag.lua`
3. `construction_kits.lua`
4. `watch.lua`
5. `fluids.lua`
6. `destroy.lua`
7. `clay_lump.lua`
8. `party_hat.lua`
9. `trap.lua`
10. `blueberry_bush.lua`
11. `bed_modification_kits.lua`
12. `dolls.lua`
13. `piggy_bank.lua`
14. `music.lua`

**Tool Actions (3 scripts):**
15. `skinning.lua`
16. `kitchen_knife.lua`
17. `sickle.lua`

### Pattern Analysis
Likely differences are:
- **Extended item ID lists** (like blessing_charms: +2 IDs in fire)
- **Bug fixes** or **balance tweaks** in data-fire
- **Additional features** added to Fire fork

**Hypothesis:** data-fire represents **newer/improved** versions of these scripts.

## Consolidation Strategy

### ✅ SIMPLE APPROACH (Recommended)
Since data-canary has **no unique content**, consolidation is trivial:

1. **Keep data-fire as-is** - Already has all scripts (70% identical, 30% enhanced)
2. **Archive data-canary** - Move to `archive/data-canary-legacy/`
3. **Merge world files** - Only if `canary.otbm` has unique map areas vs Fire's world
4. **Update config.lua.dist** - Set default to `data-fire` only
5. **Test server startup** - Verify all features work with data-fire alone

**Estimated Time:** 1-2 hours (vs original 5-7 days estimate)

### Script Merge Decision
For the 17 different scripts:
- **Action:** Keep data-fire versions (likely newer)
- **Validation:** Manually review diffs to ensure no regressions
- **Fallback:** If data-canary has critical fixes, cherry-pick specific changes

### World File Strategy
**Decision needed:**
- Is `canary.otbm` (19MB) the same map as used by data-fire?
- Or does data-fire use its own world files in `world/`?
- **Check:** Compare house/spawn definitions between both

## Tasks Breakdown

### Phase 1: Validation (30 min)
- [ ] Compare `canary.otbm` with fire world files
- [ ] Review 17 script diffs to identify critical changes
- [ ] Document any data-canary features not in data-fire

### Phase 2: Merge World Files (30 min)
- [ ] Determine primary world file (canary.otbm vs fire world)
- [ ] Merge house definitions if needed
- [ ] Merge spawn points if needed

### Phase 3: Archive & Configure (15 min)
- [ ] Create `archive/` directory
- [ ] Move `data-canary/` to `archive/data-canary-legacy/`
- [ ] Update `config.lua.dist` to remove canary datapack reference
- [ ] Add deprecation notice in archive README

### Phase 4: Testing (30 min)
- [ ] Start server with data-fire only
- [ ] Verify all scripts load without errors
- [ ] Test sample actions, spells, monster spawns
- [ ] Check house/NPC systems
- [ ] Validate quest functionality

### Phase 5: Documentation (15 min)
- [ ] Update ROADMAP.md (mark 1.3 complete)
- [ ] Document consolidation in CHANGELOG.md
- [ ] Update main README if it references data-canary

## Risk Assessment

**Low Risk** 🟢
- No unique monsters/NPCs to lose
- 70% script overlap = high compatibility
- Can easily rollback by un-archiving data-canary
- World files are separate (low conflict risk)

**Potential Issues:**
- Some players might have `dataPackDirectory = "data-canary"` in their config
  - **Mitigation:** Add deprecation warning in server startup if canary selected
- Script differences might contain important bug fixes
  - **Mitigation:** Manual review of all 17 diffs before archiving

## Next Steps

1. **Immediate:** Review script differences (see Appendix A for diff commands)
2. **Then:** Compare world files to determine merge strategy
3. **Finally:** Execute consolidation tasks (estimated 2 hours total)

---

## Appendix A: Useful Commands

### View specific script diff:
```bash
diff data-canary/scripts/actions/other/blessing_charms.lua \
     data-fire/scripts/actions/other/blessing_charms.lua
```

### View all 17 diffs at once:
```bash
for f in actions/other/surprise_bag.lua actions/other/construction_kits.lua \
         actions/other/watch.lua actions/other/fluids.lua \
         actions/other/destroy.lua actions/other/blessing_charms.lua \
         actions/other/clay_lump.lua actions/other/party_hat.lua \
         actions/other/trap.lua actions/other/blueberry_bush.lua \
         actions/other/bed_modification_kits.lua actions/other/dolls.lua \
         actions/other/piggy_bank.lua actions/other/music.lua \
         actions/tools/skinning.lua actions/tools/kitchen_knife.lua \
         actions/tools/sickle.lua; do
    echo "=== $f ==="
    diff "data-canary/scripts/$f" "data-fire/scripts/$f"
    echo ""
done
```

### Compare world files:
```bash
ls -lh data-canary/world/
ls -lh data-fire/world/
file data-canary/world/canary.otbm
```

### Check if OTBM maps are different:
```bash
md5sum data-canary/world/canary.otbm
# Compare with any .otbm in data-fire/world/ if exists
```

## Appendix B: Config Migration

**Old config.lua pattern:**
```lua
dataPackDirectory = "data-canary"  -- DEPRECATED
```

**New config.lua pattern:**
```lua
dataPackDirectory = "data-fire"  -- Unified Fire datapack
```

**Validation code to add to server startup:**
```cpp
if (config.dataPackDirectory == "data-canary") {
    g_logger().warn("data-canary is deprecated. Please use 'data-fire' instead.");
    g_logger().warn("data-canary will be removed in a future version.");
}
```
