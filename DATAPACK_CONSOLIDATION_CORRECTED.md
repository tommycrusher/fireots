# Datapack Consolidation Analysis - CORRECTED
**Phase 1.3: Konsolidacja Datapacków**
**Date:** 2025-11-15
**Status:** ⚠️ REQUIRES CAREFUL REVIEW

## Executive Summary

**CORRECTION**: Initial analysis was **incorrect**. After thorough re-examination:

- data-canary is **NOT empty** - contains 136 files including 66 monsters, 57 scripts, 1 NPC
- data-canary is a **selective subset** (4% monsters, 3% scripts) of data-fire
- **23 unique files** exist only in data-canary that need to be evaluated before consolidation
- **Estimated effort**: 4-6 hours (not 2 hours) due to unique content review

### Critical Finding: Unique Content in data-canary

data-canary contains files that **do NOT exist** in data-fire:

#### Unique Monsters (2 files)
1. `monster/bosses/shadowpelt.lua` - Boss creature
2. `monster/dragons/ice_dragon.lua` - Dragon variant

#### Unique Scripts (21 files)
1. `birdcage.lua`
2. `christmas_bundle.lua`
3. `create_bread.lua`
4. `decay_to.lua`
5. `drop_loot.lua`
6. `extended_opcode.lua`
7. `ferumbras_staff.lua`
8. `free_quest.lua`
9. `ladder_up.lua`
10. `large_sea_shell.lua`
11. `monster.lua`
12. `premium_scroll.lua`
13. `quests.lua`
14. `scripted_weapons.lua`
15. `snow_heap.lua`
16. `spellwand.lua`
17. `spider_egg.lua`
18. `sugar_oat.lua`
19. `summon_challenge.lua`
20. `sweetheart_ring.lua`
21. `waterpipe.lua`

**Plus**: 1 unique script found via directory scan:
- `scripts/movements/cake.lua`

## Detailed Inventory

### data-canary/ Content
```
Total Files:       136

Monsters:          66 Lua files (4% of fire's 1,578)
├─ giants:         4 (cyclops, cyclops_drone, cyclops_smith, behemoth)
├─ undeads:        3 (mummy, skeleton, ghoul)
├─ humanoids:      4 (troll, frost_troll, island_troll, goblin)
├─ vermins:        4 (spider, poison_spider, wasp, sandcrawler)
├─ familiars:      4 (paladin, sorcerer, knight, druid)
├─ magicals:       1 (guzzlemaw)
├─ bosses:         1 (shadowpelt) ⚠️ UNIQUE
├─ dragons:        1 (ice_dragon) ⚠️ UNIQUE
└─ [other categories]

NPCs:              1 Lua file (0.1% of fire's 1,048)
└─ canary.lua

Scripts:           57 Lua files (3% of fire's 1,924)
├─ 21 UNIQUE scripts (see list above)
├─ 36 scripts that exist in fire

Libraries:         4 files
├─ lib/core/quests.lua
├─ lib/core/storages.lua
├─ lib/core/load.lua
└─ lib/lib.lua

Migrations:        2 files
├─ migrations/0.lua
└─ migrations/1.lua

Raids:             2 files
├─ raids/raids.xml
└─ raids/example.xml

World Files:       4 files
├─ canary.otbm (19 MB)
├─ canary-house.xml (146 bytes)
├─ canary-npc.xml (790 bytes)
└─ canary-monster.xml (35 bytes)
```

### data-fire/ Content
```
Total Files:       4,958

Monsters:          1,578 Lua files
NPCs:              1,048 Lua files
Scripts:           1,924 Lua files
Libraries:         23 files
Migrations:        45 files
Raids:             88 files
World Files:       Multiple (fire world directory structure)
```

## Comparison Analysis

### Overlap Statistics
- **Monsters**: 64 out of 66 canary monsters exist in fire (97% overlap)
- **Scripts**: 36 out of 57 canary scripts exist in fire (63% overlap)
- **NPCs**: 0 out of 1 canary NPC exists in fire (0% overlap - "canary.lua" unique)

### Files Requiring Review

#### High Priority (Must Review)
1. **2 unique monsters** - Need gameplay/balance review
2. **21 unique scripts** - Could be Canary-specific features or legacy content
3. **NPC canary.lua** - Likely Canary-specific NPC
4. **Libraries** - May conflict with fire's lib system
5. **Migrations** - May overlap with fire's migrations (45 files)

#### Medium Priority
- **Raids** - Compare with fire's 88 raid files
- **World files** - Canary map vs Fire world structure

## Consolidation Strategy (Revised)

### Phase 1: Inventory & Classification (COMPLETED ✅)
- [x] Count all files in both datapacks
- [x] Identify unique files in data-canary
- [x] Create comprehensive comparison

### Phase 2: Content Review (IN PROGRESS 🔄)
**Estimated Time**: 2-3 hours

For each unique file, determine:
1. **Keep**: Essential content missing from fire
2. **Discard**: Obsolete/redundant Canary-specific content
3. **Merge**: Improved version needs merging with fire equivalent

Tasks:
- [ ] Review 2 unique monsters (shadowpelt, ice_dragon)
  - Check if renamed/moved in fire
  - Verify stats/scripts compatibility
- [ ] Review 21 unique scripts
  - Read each script to understand purpose
  - Check if functionality exists differently in fire
  - Decide: copy, merge, or skip
- [ ] Review canary.lua NPC
  - Determine if it's test/demo NPC or essential
- [ ] Review lib files (quests.lua, storages.lua)
  - Compare with fire's lib/core/ system
  - Check for conflicts
- [ ] Review migrations 0.lua and 1.lua
  - Check if already covered by fire's 45 migrations
  - Verify database schema changes

### Phase 3: Merge Execution
**Estimated Time**: 1-2 hours

Based on review decisions:
1. Copy "Keep" files to data-fire (preserve canary/ subdirectory structure)
2. Manually merge "Merge" files (if any)
3. Document discarded files and reasons

### Phase 4: Testing & Validation
**Estimated Time**: 1 hour

1. Start server with consolidated datapack
2. Check for Lua errors on startup
3. Test spawns, NPCs, quests from merged content
4. Verify no broken references

### Phase 5: Archive & Cleanup
**Estimated Time**: 30 minutes

1. Create `archive/data-canary-legacy/` directory
2. Move original `data-canary/` to archive
3. Update `config.lua.dist` (remove data-canary reference)
4. Update documentation
5. Commit consolidation

## Risk Assessment

### Low Risk ✅
- Overlapping monsters/scripts (97% monster overlap)
- World files (separate map, no conflicts)

### Medium Risk ⚠️
- Library files (may conflict with fire's core libs)
- Migrations (may duplicate fire's migrations)

### High Risk ⚠️
- Unique scripts (21 files) - Unknown functionality/dependencies
- Unique monsters (2 files) - May break spawn.xml references

## Next Steps

1. **IMMEDIATE**: Review unique monsters
   ```bash
   cat data-canary/monster/bosses/shadowpelt.lua
   cat data-canary/monster/dragons/ice_dragon.lua
   ```

2. **NEXT**: Review unique scripts (prioritize by category)
   - Start with actions (likely quest/item scripts)
   - Check movements (likely tile/teleport scripts)
   - Review creaturescripts (likely combat/event scripts)

3. **THEN**: Review libs and migrations
   - Compare lib/core/quests.lua with fire's equivalent
   - Check migration overlap

4. **FINALLY**: Execute merge based on review decisions

## Questions to Answer

- [ ] Are shadowpelt/ice_dragon renamed versions of fire monsters?
- [ ] Do unique scripts implement features already in fire differently?
- [ ] Do lib files conflict with fire's core library system?
- [ ] Are migrations 0.lua and 1.lua covered by fire's migration sequence?
- [ ] Is canary.lua NPC referenced anywhere in canary.otbm map?

## Estimated Timeline

**Total Time**: 4-6 hours (revised from 2 hours)

- Phase 2 (Review): 2-3 hours ⏱️
- Phase 3 (Merge): 1-2 hours
- Phase 4 (Test): 1 hour
- Phase 5 (Cleanup): 30 minutes

**Complexity**: Medium (was assessed as Low initially - CORRECTED)
