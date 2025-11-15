# Changelog

All notable changes to the Fireots project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.5.0-rebrand] - 2025-11-15

### Added
- Comprehensive project documentation (FIREOTS.md, ROADMAP.md, UPSTREAM_INTEGRATION.md)
- AI agent instructions (.github/copilot-instructions.md)
- Automated rebranding scripts (scripts/rebrand.sh, scripts/update_headers.sh)
- PROJECT_SUMMARY.md documenting deliverables

### Changed
- **BREAKING**: Renamed executable from `canary` to `fireots`
- **BREAKING**: Renamed main class from `CanaryServer` to `FireotsServer`
- **BREAKING**: Renamed exception from `FailedToInitializeCanary` to `FailedToInitializeFireots`
- CMake project name from `canary` to `fireots`
- All build scripts updated for fireots binary (recompile.sh, start_fire.sh, start_gdb.sh, fire-sh)
- Docker configuration rebranded (network: canary-net → fireots-net, paths: /srv/canary → /srv/fireots)
- Docker images now use fireots binary and include data-fire directory
- Configuration validation now accepts `data-fire`, `data-canary`, and `data-otservbr-global`
- All source file headers updated to Fireots branding while preserving GPL-2.0 license
- CMake library renamed from CanaryLib to FireotsLib
- Resource files renamed: canary.rc → fireots.rc, canary.ico → fireots.ico

### Documentation
- Updated README.md with Fireots branding
- Updated .github/copilot-instructions.md with complete rebranding status
- Updated FIREOTS.md examples from CanaryServer to FireotsServer
- Marked Phase 1.1 tasks as completed in ROADMAP.md

## [1.4.0] - 2025-01-XX (Pre-rebranding baseline)

### Inherited from Canary
- Full C++20 MMORPG server implementation
- Lua scripting integration with bidirectional C++ binding
- Dependency injection architecture using boost::di
- Multi-threaded ASIO networking layer
- MySQL database integration
- Comprehensive game systems (combat, spells, monsters, NPCs, items, etc.)
- Test suite using Boost::ut
- Docker support for containerized deployment

---

## Version History Notes

**Fireots** is a fork of **Canary** (opentibiabr/canary) with the following relationship:
- 13 commits ahead (Fireots-specific changes including complete rebranding)
- 623 commits behind (upstream Canary development not yet integrated)

For upstream changes, see: https://github.com/opentibiabr/canary/commits/main

For integration strategy, see: [UPSTREAM_INTEGRATION.md](UPSTREAM_INTEGRATION.md)
