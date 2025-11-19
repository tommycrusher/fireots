# Critical Commits Integration Plan

## Phase 2.1.1: Security & Crash Fixes (Top 10 Priority)

### ✅ Completed
1. **0d253f833** - Gamestore exploit fix
   - Status: INTEGRATED
   - Conflicts: Resolved (KV-based system vs Storage values)
   - Testing: Pending build completion

### 🎯 Next Batch (nullptr checks - 8 commits)

2. **52cd7c32b** - nullptr checks at game functions
   - Impact: Prevents server crashes from null pointer access
   - Files: Likely src/game/game.cpp
   - Expected conflicts: Fireots naming (Canary → Fireots)

3. **eea450fd1** - warn instead of sendHouseAuctionMessage on null
   - Impact: Prevents crash when house auction data is null
   - Files: src/game/game.cpp or src/creatures/players/player.cpp
   - Expected conflicts: Low

4. **fc4ad93d5** - possible null at playerrequesttrade
   - Impact: Prevents crash during trade requests
   - Files: src/server/network/protocol/protocolgame.cpp
   - Expected conflicts: Low

5. **73fff359a** - InstantSpell nullptr
   - Impact: Prevents crash when casting invalid spells
   - Files: src/lua/functions/creatures/combat/spell_functions.cpp
   - Expected conflicts: Low

6. **cf8700680** - Bank deposit nullptr
   - Impact: Prevents crash during bank operations
   - Files: src/creatures/players/player.cpp
   - Expected conflicts: Low

7. **e2b898e16** - ReplaceThing bounds checks
   - Impact: Prevents buffer overflow/crash
   - Files: src/items/item.cpp or src/game/game.cpp
   - Expected conflicts: Medium

8. **995bf7f33** - Combat/spell tile nullptr
   - Impact: Prevents crash in combat system
   - Files: src/creatures/combat/combat.cpp
   - Expected conflicts: Low

9. **873b275b3** - Cyclopedia tracker uint8_t limit (client crash)
   - Impact: Prevents client crashes from cyclopedia data overflow
   - Files: src/game/game.cpp or cyclopedia specific files
   - Expected conflicts: Low

10. **9a8f7f6a5** - Shop cleanup crash
    - Impact: Prevents crash when closing shops
    - Files: src/game/game.cpp or shop related files
    - Expected conflicts: Low

## Integration Strategy

### Batch Processing
- **Batch 1** (commits 2-5): Basic nullptr checks
- **Batch 2** (commits 6-10): Complex checks and bounds validation

### Cherry-pick Workflow
```bash
# For each commit:
git cherry-pick <commit-hash>

# If conflicts:
# 1. Identify conflict type (naming vs logic)
# 2. Resolve keeping Fireots naming
# 3. Test compilation
# 4. Verify fix doesn't break existing code

git add <resolved-files>
git cherry-pick --continue
```

### Testing Protocol
After each batch:
1. **Compilation**: `cmake --build build/linux-release`
2. **Server Start**: `./fireots` (verify no crashes on startup)
3. **Functional Test**: Test affected system if possible
4. **Commit Documentation**: Update this file with results

### Conflict Resolution Guidelines
- **Naming conflicts**: Always use Fireots naming
- **Logger calls**: Keep Fireots logger patterns
- **DI patterns**: Keep Fireots dependency injection style
- **Logic conflicts**: Prefer upstream fix, adapt to Fireots structure

## Expected Timeline
- **Batch 1** (4 commits): 30-60 minutes
- **Batch 2** (5 commits): 60-90 minutes
- **Total**: 2-2.5 hours for all 9 remaining critical commits

## Validation Criteria
- ✅ Compiles without errors
- ✅ Server starts successfully
- ✅ No new crashes introduced
- ✅ Fix addresses original vulnerability
- ✅ Fireots naming conventions maintained

## Notes
- All commits are from opentibiabr/canary upstream
- Focus on security and stability over features
- Document any deviations from upstream in commit messages
- Keep integration branch separate until full validation

Last updated: 2025-11-15 (Build in progress)
