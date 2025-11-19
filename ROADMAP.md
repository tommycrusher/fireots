# Fireots Development Roadmap

**Version**: 1.0
**Last Updated**: November 14, 2025
**Status**: Active Development

---

## Executive Summary

This roadmap outlines the strategic development plan for Fireots, prioritizing:

1. **Complete Rebranding** from Canary to Fireots
2. **Datapack Consolidation** (merge data-canary → data-fire)
3. **Selective Upstream Integration** (evaluate 623 commits behind)
4. **Code Quality Improvements** (testing, documentation, CI/CD)
5. **Performance Optimization** (profiling, threading, caching)

**Timeline**: Q4 2025 - Q2 2026

---

## Phase 1: Foundation & Rebranding (Q4 2025)

### Priority: CRITICAL
**Goal**: Establish Fireots identity and clean technical debt

### 1.1 Complete Rebranding ✅

**Status**: **COMPLETED** (Released as v1.5.0-rebrand on 2025-11-15)
**Estimated Effort**: 2-3 days
**Actual Effort**: 1 day
**Impact**: High (project identity)

#### Tasks:

- [x] **Update all source file headers** ✅ COMPLETED (1000+ files)
  - Replace Canary copyright with Fireots + attribution
  - Update repository URLs
  - Update license references
  - Script: Created `scripts/update_headers.sh`

- [x] **Rename main classes** ✅ COMPLETED
  - `CanaryServer` → `FireotsServer`
  - `FailedToInitializeCanary` → `FailedToInitializeFireots`
  - Updated all references in codebase (421 files)

- [x] **Rename binary** ✅ COMPLETED
  - CMake project: `canary` → `fireots`
  - Executable output: `canary` → `fireots`
  - Updated all build scripts (`recompile.sh`, `start_fire.sh`, `start_gdb.sh`, `fire-sh`)

- [x] **Update configuration validation** ✅ COMPLETED
  - Accepts "data-fire", "data-canary", "data-otservbr-global"
  - Datapack validation updated in `src/fireots_server.cpp`
  - `useAnyDatapackFolder` functionality preserved

- [x] **Update Docker configuration** ✅ COMPLETED
  - Updated all Dockerfiles (dev, arm, x86) to use `fireots` binary
  - Updated docker-compose.yml with fireots network and paths
  - Added data-fire directory to Docker builds

- [x] **Update documentation** ✅ COMPLETED
  - README.md (already done, verified)
  - .github/copilot-instructions.md updated
  - CMakeLists.txt and CMake modules updated
  - Doxygen configuration

**Success Criteria**:
- [x] All "Canary" references in code replaced (except historical attribution)
- [x] Binary builds as `fireots`
- [x] Docker images tagged as `fireots/fireots:latest`
- [x] No broken links in documentation

**Release**: v1.5.0-rebrand (2025-11-15)
- 6 commits merged from feature/rebrand-fireots branch
- 433 files changed (5662 insertions, 2113 deletions)
- See [REBRAND_SUMMARY.md](REBRAND_SUMMARY.md) for detailed report

---

### 1.2 Documentation Completion 🟡

**Estimated Effort**: 3-4 days
**Blocker**: Rebranding completion
**Impact**: Medium (onboarding, maintenance)

#### Tasks:

- [x] **Create FIREOTS.md** (completed)
  - Comprehensive architecture guide
  - Development workflows
  - Contribution guidelines

- [ ] **Update GitHub Wiki**
  - Getting Started guide
  - Building from source (Linux, Windows, macOS)
  - Configuration reference
  - Troubleshooting common issues

- [ ] **API Documentation**
  - Generate Doxygen docs from source
  - Host on GitHub Pages or docs.fireots.pl
  - Document Lua API bindings

- [ ] **Datapack Documentation**
  - data-fire/ structure guide
  - Script creation tutorial
  - Monster/NPC definition reference
  - Quest system guide

- [ ] **Migration Guides**
  - From Canary to Fireots
  - From OTServBR-Global to Fireots
  - Database migration procedures

**Success Criteria**:
- New contributors can build and run server in <30 minutes
- API documentation covers all public interfaces
- Datapack guide enables custom content creation

---

### 1.3 Datapack Consolidation ✅

**Status**: **COMPLETED** (2025-11-16)
**Estimated Effort**: 5-7 days (planning + execution)
**Actual Effort**: 6 hours (analysis revealed no merge needed)
**Impact**: High (simplified maintenance, removed obsolete code)
**Final Cleanup**: All references removed from config, Dockerfiles, and documentation

#### Analysis Phase ✅ COMPLETED:

- [x] **Inventory data-canary/ content**
  - 136 files total: 66 monsters, 1 NPC, 57 scripts, 4 libs, 2 migrations, 2 raids
  - 19MB world file (canary.otbm)
  - All content analyzed for uniqueness

- [x] **Inventory data-fire/ content**
  - 4,958 files: 1,578 monsters, 1,048 NPCs, 1,924 scripts
  - 23 libs, 45 migrations, 88 raids
  - Complete production datapack

- [x] **Analyze unique content**
  - 22 unique scripts in data-canary (all obsolete examples)
  - 2 "unique" monsters (actually older versions of fire monsters)
  - All libs/migrations are example/demo code

- [x] **Create decision matrix**
  | Content Type | data-canary | data-fire | Decision |
  |--------------|-------------|-----------|----------|
  | Monsters     | 66          | 1,578     | SKIP - all exist in fire (better versions) |
  | NPCs         | 1           | 1,048     | SKIP - demo NPC only |
  | Scripts      | 57 (22 unique) | 1,924  | SKIP - all are examples/demos |
  | Libs         | 4 (43 lines) | 4 (3,131 lines) | SKIP - fire has complete versions |
  | Migrations   | 2 (empty)   | 45        | SKIP - example only |

#### Key Findings:

**data-canary is 100% obsolete demo/example code**:
- Monsters: All exist in fire with better stats (Shadowpelt: 6000 HP in fire vs 5000 in canary)
- Scripts: Examples like "ExampleQuest", demo items (birdcage, christmas_bundle)
- Libs: storages.lua 43 lines vs fire's 3,131 lines
- Migrations: Empty examples vs fire's 45 production migrations

#### Execution Phase ✅ COMPLETED:

- [x] **Archive data-canary**
  - Moved to `archive/data-canary-legacy/`
  - Created `archive/README.md` with analysis summary
  - No files merged (fire datapack is complete)

- [x] **Update configuration**
  - `config.lua.dist`: Default changed to `data-fire`
  - `fireots_server.cpp`: Removed data-canary from validation
  - Added note about archived datapacks

- [x] **Update documentation**
  - Created `DATAPACK_CONSOLIDATION_CORRECTED.md` with full analysis
  - Updated this roadmap section

**Success Criteria**: ✅ ALL MET
- [x] Single `data-fire/` datapack in production use
- [x] No merge needed - fire is complete and superior
- [x] data-canary archived with comprehensive documentation
- [x] Config updated to use data-fire by default
- [x] Server validates only data-fire (or custom with useAnyDatapackFolder)

**Result**: Consolidation simplified to archival - no actual merge needed. Fire datapack confirmed as complete, production-ready codebase.
- No `data-canary/` references in code
- All features functional
- Documentation updated

---

## Phase 2: Upstream Integration (Q1 2026)

### Priority: HIGH
**Goal**: Backport valuable improvements from opentibiabr/canary

### 2.1 Upstream Commit Analysis 🟡

**Estimated Effort**: 3-5 days
**Blocker**: None
**Impact**: Medium (feature parity, security)

#### Tasks:

- [ ] **Categorize 623 commits**
  ```bash
  git fetch upstream
  git log HEAD..upstream/main --oneline > upstream_commits.txt
  ```

  - **Security**: CVE fixes, auth vulnerabilities
  - **Critical Bugs**: Crashes, data corruption
  - **Performance**: Profiling-proven optimizations
  - **Features**: New game mechanics
  - **Refactoring**: Code quality improvements
  - **Cosmetic**: Formatting, comments

- [ ] **Identify high-priority commits**
  - Security fixes: **IMMEDIATE**
  - Critical bugs: **HIGH**
  - Performance: **MEDIUM** (if >10% improvement)
  - Features: **LOW** (evaluate fit)

- [ ] **Create integration plan**
  - List of commits to cherry-pick
  - Order of integration (dependencies)
  - Testing strategy for each

- [ ] **Document decisions**
  - Why commits accepted/rejected
  - Modification notes for adapted commits
  - Store in UPSTREAM_INTEGRATION.md

**Success Criteria**:
- All security fixes integrated
- All critical bugs patched
- Integration plan documented

---

### 2.2 Selective Backporting 🟡

**Estimated Effort**: 10-15 days
**Blocker**: Commit analysis completion
**Impact**: High (stability, features)

#### Process per commit:

1. **Review commit**:
   ```bash
   git show <commit-hash>
   ```

2. **Test locally**:
   ```bash
   git cherry-pick <commit-hash>
   cmake --build linux-release
   ./build/linux-release/bin/fireots
   ```

3. **Resolve conflicts** (if any)

4. **Run tests**:
   ```bash
   ctest --verbose
   ```

5. **Document integration** in CHANGELOG.md

#### High-Priority Targets (Examples):

- [ ] **Security: SQL injection fixes**
- [ ] **Bug: Memory leak in player logout**
- [ ] **Performance: Map tile caching**
- [ ] **Feature: Improved anti-cheat**
- [ ] **Refactor: Thread-safe event dispatcher**

**Success Criteria**:
- No regressions introduced
- All tests passing
- Performance maintained or improved
- CHANGELOG.md updated

---

## Phase 3: Quality & Testing (Q1 2026)

### Priority: MEDIUM
**Goal**: Improve code quality, test coverage, and maintainability

### 3.1 Test Coverage Expansion 🟢

**Estimated Effort**: 7-10 days
**Blocker**: None
**Impact**: High (regression prevention)

#### Current Coverage (Estimated):
- Unit tests: ~15% of src/
- Integration tests: ~5%
- **Target**: 60% unit, 30% integration

#### Tasks:

- [ ] **Core systems tests**
  - Game loop (`src/game/game.cpp`)
  - Creature management
  - Item system
  - Map queries

- [ ] **Network layer tests**
  - Protocol parsing
  - Message serialization
  - Connection handling

- [ ] **Database layer tests**
  - Query builders
  - Connection pooling
  - Migration system (future)

- [ ] **Lua integration tests**
  - Script loading
  - C++/Lua data exchange
  - Error handling

- [ ] **CI/CD test automation**
  - GitHub Actions: build + test on PR
  - Code coverage reporting (Codecov)
  - Automated regression detection

**Success Criteria**:
- >60% code coverage (measured by gcov/lcov)
- All critical paths tested
- CI/CD pipeline green

---

### 3.2 Code Quality Tools 🟢

**Estimated Effort**: 3-5 days
**Blocker**: None
**Impact**: Medium (maintainability)

#### Tasks:

- [ ] **Static Analysis**
  - Enable Clang-Tidy in CMake
  - Configure rules (.clang-tidy)
  - Fix reported issues (or suppress with justification)

- [ ] **Code Formatting**
  - Enforce .clang-format consistently
  - Add pre-commit hook
  - Format all existing code

- [ ] **Linting**
  - Lua linting with luacheck
  - XML validation for data files
  - SQL linting for migrations

- [ ] **Metrics**
  - Cyclomatic complexity analysis
  - Code duplication detection (CPD)
  - Dependency graph visualization

**Success Criteria**:
- Zero warnings from Clang-Tidy on new code
- All code passes formatter
- Metrics tracked in CI

---

## Phase 4: Performance Optimization (Q2 2026)

### Priority: MEDIUM
**Goal**: Improve server performance under load

### 4.1 Profiling & Benchmarking 🟢

**Estimated Effort**: 5-7 days
**Blocker**: None
**Impact**: Medium (scalability)

#### Tasks:

- [ ] **Establish baselines**
  - Players online: 100, 500, 1000
  - CPU usage
  - Memory usage
  - Network throughput

- [ ] **Profile hot paths**
  - Tools: Valgrind, perf, gprof
  - Identify top 10 bottlenecks
  - Document in PERFORMANCE.md

- [ ] **Benchmark game operations**
  - Player movement (ticks/sec)
  - Combat calculations
  - Pathfinding
  - Database queries

**Success Criteria**:
- Baseline metrics documented
- Bottlenecks identified and prioritized

---

### 4.2 Optimization Implementation 🟢

**Estimated Effort**: 10-15 days
**Blocker**: Profiling completion
**Impact**: High (player experience)

#### Potential Optimizations:

- [ ] **Map tile caching**
  - Cache frequently-accessed tiles
  - Reduce repeated OTBM reads
  - **Target**: 20% reduction in map query time

- [ ] **Creature update batching**
  - Group creature updates per tick
  - Reduce per-creature overhead
  - **Target**: Support 50% more creatures

- [ ] **Database connection pooling**
  - Reuse connections
  - Async query execution
  - **Target**: 30% faster queries

- [ ] **Lua script compilation caching**
  - Cache compiled Lua bytecode
  - Reduce reload times
  - **Target**: 50% faster script loading

- [ ] **SIMD optimizations**
  - Vectorize combat calculations
  - Optimize pathfinding
  - **Target**: 10-15% overall speedup

**Success Criteria**:
- Measurable performance gains (benchmarked)
- No functionality regressions
- Server supports 2x player capacity

---

## Phase 5: Features & Polish (Q2 2026)

### Priority: LOW
**Goal**: Add Fire-specific features and polish

### 5.1 Fire-Specific Features 🔵

**Estimated Effort**: Variable (per feature)
**Blocker**: None
**Impact**: Medium (differentiation)

#### Proposed Features:

- [ ] **Enhanced admin tools**
  - Web-based admin panel
  - Real-time player monitoring
  - Server analytics dashboard

- [ ] **Improved anti-cheat**
  - Pattern-based detection
  - Automated ban system
  - Appeal workflow

- [ ] **Custom quest system**
  - Visual quest editor
  - Branching narratives
  - Dynamic rewards

- [ ] **Economy simulation**
  - Inflation tracking
  - Market analytics
  - Trade visualization

**Success Criteria**:
- Features fully tested
- Documentation written
- Player feedback incorporated

---

### 5.2 Community Building 🔵

**Estimated Effort**: Ongoing
**Blocker**: None
**Impact**: High (long-term success)

#### Tasks:

- [ ] **Discord server**
  - Developer channels
  - Support channels
  - Announcement bot

- [ ] **Contribution guides**
  - First-time contributor tutorial
  - Good first issues tagged
  - Mentorship program

- [ ] **Public roadmap**
  - GitHub Projects board
  - Monthly updates
  - Community voting on features

- [ ] **Release management**
  - Semantic versioning
  - Changelog automation
  - Beta/stable channels

**Success Criteria**:
- Active community (>50 Discord members)
- Regular contributions (>5 contributors)
- Quarterly releases

---

## Milestones & Timeline

| Milestone | Target Date | Status |
|-----------|-------------|--------|
| **M1: Rebranding Complete** | Dec 15, 2025 | 🟡 In Progress |
| **M2: Documentation Complete** | Dec 31, 2025 | 🟡 In Progress |
| **M3: Datapack Consolidated** | Jan 15, 2026 | 🔴 Not Started |
| **M4: Upstream Integration** | Feb 28, 2026 | 🔴 Not Started |
| **M5: Test Coverage 60%+** | Mar 31, 2026 | 🔴 Not Started |
| **M6: Performance Optimized** | May 31, 2026 | 🔴 Not Started |
| **M7: First Stable Release** | Jun 30, 2026 | 🔴 Not Started |

---

## Risk Assessment

### High Risk

| Risk | Impact | Mitigation |
|------|--------|------------|
| Upstream divergence | Difficult to sync | Selective cherry-picking, not bulk merges |
| Datapack merge conflicts | Data loss | Thorough testing, backups, rollback plan |
| Performance regressions | Poor player experience | Continuous benchmarking, profiling |

### Medium Risk

| Risk | Impact | Mitigation |
|------|--------|------------|
| Contributor burnout | Slow development | Clear roadmap, manageable tasks |
| Community fragmentation | Reduced adoption | Active communication, Discord |
| Breaking changes | Compatibility issues | Semantic versioning, migration guides |

### Low Risk

| Risk | Impact | Mitigation |
|------|--------|------------|
| Build system changes | CI/CD failures | Locked dependency versions |
| Documentation staleness | Confusion | Quarterly doc review |

---

## Success Metrics

### Technical Metrics

- **Build time**: <5 min on standard hardware
- **Test coverage**: >60% unit, >30% integration
- **Performance**: Support 1000+ concurrent players
- **Uptime**: 99.9% (measured over 30 days)

### Community Metrics

- **Contributors**: >10 active (1+ commit/month)
- **GitHub stars**: >500
- **Discord members**: >100
- **Public servers**: >5 running Fireots

### Quality Metrics

- **Bug reports**: <10 critical/month
- **Security CVEs**: 0 (handled within 48h)
- **Documentation gaps**: <5 reported/month

---

## Resource Requirements

### Development Team (Estimated)

- **Lead Developer**: 1 (full-time equivalent)
- **Contributors**: 3-5 (part-time)
- **Testers**: 2-3 (volunteer)
- **Documentation**: 1 (part-time)

### Infrastructure

- **CI/CD**: GitHub Actions (free tier)
- **Hosting**: Documentation site (GitHub Pages)
- **Testing**: Cloud VM for integration tests

### Time Commitment

- **Phase 1**: 2-3 weeks (40-60 hours)
- **Phase 2**: 3-4 weeks (60-80 hours)
- **Phase 3**: 2-3 weeks (40-60 hours)
- **Phase 4**: 3-4 weeks (60-80 hours)
- **Phase 5**: Ongoing (10-20 hours/month)

---

## Appendix: Upstream Commit Categories

### Security Fixes (IMMEDIATE)
Commits addressing CVEs, authentication bypasses, or privilege escalation.

**Action**: Cherry-pick immediately, test, release hotfix.

### Critical Bugs (HIGH)
Crashes, data corruption, game-breaking bugs.

**Action**: Cherry-pick within 1 week, include in next release.

### Performance (MEDIUM)
Optimizations with measurable improvements (>5%).

**Action**: Evaluate, benchmark locally, cherry-pick if validated.

### Features (LOW)
New game mechanics, systems, or content.

**Action**: Evaluate fit for Fire vision, implement selectively.

### Refactoring (EVALUATE)
Code quality improvements, architectural changes.

**Action**: Review, cherry-pick if improves maintainability.

### Cosmetic (DEFER)
Formatting, comments, documentation.

**Action**: Low priority, batch with other changes.

---

**This roadmap is a living document. Updates will be made quarterly or as priorities shift.**

**Questions or Suggestions?** Open an issue on GitHub: https://github.com/tommycrusher/fireots/issues

**Contributors**: See [CONTRIBUTING.md](CONTRIBUTING.md) for how to help implement this roadmap.
