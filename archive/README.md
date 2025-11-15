# Archived Datapacks

This directory contains legacy datapacks that have been superseded by `data-fire`.

## data-canary-legacy/

**Archived:** 2025-11-15  
**Reason:** Obsolete demo/example code

### Analysis Summary

After comprehensive analysis, `data-canary` was found to contain only example/demo code:

- **Monsters (66)**: All exist in `data-fire` with better stats (e.g., Shadowpelt: 6000 HP in fire vs 5000 in canary)
- **Scripts (57)**: 22 unique files, all are either:
  - Obsolete examples (ExampleQuest, example migrations)
  - Inferior versions (drop_loot: 11 lines vs fire's 16 with Dawnport support)
  - Simple demos (birdcage, christmas_bundle, etc.)
- **NPCs (1)**: Demo NPC "canary.lua"
- **Libs (4)**: Example files (storages: 43 lines vs fire's 3,131)
- **Migrations (2)**: Empty examples vs fire's 45 production migrations
- **World**: Test map `canary.otbm` (19 MB)

### Consolidation Decision

**No files merged** - `data-fire` is complete and superior in all aspects.

### Files Analyzed

Unique scripts reviewed (all skipped):
- Actions (14): birdcage, christmas_bundle, create_bread, ferumbras_staff, ladder_up, large_sea_shell, premium_scroll, quests, snow_heap, spellwand, spider_egg, sugar_oat, sweetheart_ring, waterpipe
- Creaturescripts (4): drop_loot, extended_opcode, free_quest, monster
- Movements (2): cake, decay_to
- Spells (1): summon_challenge
- Weapons (1): scripted_weapons

All had either:
1. Better versions in `data-fire`
2. No practical value (examples/demos)
3. Outdated implementations

### Restoration

If you need to restore `data-canary` for historical purposes:

```bash
# Move back to root (not recommended)
mv archive/data-canary-legacy data-canary

# Update config.lua
dataPackDirectory = "data-canary"
```

**Note**: Use `useAnyDatapackFolder = true` to use archived datapacks.

### Reference

- Analysis document: `DATAPACK_CONSOLIDATION_CORRECTED.md`
- Decision matrix: Created 2025-11-15
- Phase 1.3 completion: Part of Fireots roadmap
