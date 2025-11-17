# Fireots (OpenTibia Engine Fork)

[![GitHub issues](https://img.shields.io/github/issues/tommycrusher/fireots)](https://github.com/tommycrusher/fireots/issues)
[![GitHub pull request](https://img.shields.io/github/issues-pr/tommycrusher/fireots)](https://github.com/tommycrusher/fireots/pulls)
[![Contributors](https://img.shields.io/github/contributors/tommycrusher/fireots.svg?style=flat-square)](https://github.com/tommycrusher/fireots/graphs/contributors)
[![GitHub](https://img.shields.io/github/license/tommycrusher/fireots)](https://github.com/tommycrusher/fireots/blob/main/LICENSE)
[![Discord Channel](https://img.shields.io/discord/528117503952551936.svg?style=flat-square&logo=discord)](https://discord.gg/gvTj5sh9Mp)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=opentibiabr_canary&metric=alert_status)](https://sonarcloud.io/dashboard?id=opentibiabr_canary)
![GitHub repo size](https://img.shields.io/github/repo-size/tommycrusher/fireots)

## Overview
Fireots is a C++20 MMORPG server emulator forked from Canary / OTServBR-Global. Focus: clean engine + full upstream feature parity with distinct branding. Tech stack: Boost.DI, LuaJIT, ASIO, MariaDB, Protobuf (select), unified datapack system.

## Datapacks
- Core libs (read-only): `data/`
- Unified active pack: `data-fire/`
- Upstream parity: `data-otservbr-global/`
- Legacy archive: `archive/data-canary-legacy/`
Configured via `config.lua` (`dataPackDirectory`). Valid names: `data-fire`, `data-canary`, `data-otservbr-global` (or enable `USE_ANY_DATAPACK_FOLDER`).

## Docker
```
docker pull tommycrusher/fireots:latest
```
See `docker/` for dev images.

## Quick Build (Linux / macOS)
```
git clone https://github.com/tommycrusher/fireots
cd fireots
export VCPKG_ROOT=$PWD/vcpkg
git clone https://github.com/microsoft/vcpkg "$VCPKG_ROOT"
"$VCPKG_ROOT"/bootstrap-vcpkg.sh
cmake --preset linux-release
cmake --build linux-release -j
./build/linux-release/bin/fireots --help
```

### Windows Build (PowerShell)
Prerequisites:
* Visual Studio 2022 (C++ workload)
* CMake >= 3.24 (`winget install cmake`)
* Git
* (Optional) Ninja

First time:
```powershell
git clone https://github.com/tommycrusher/fireots
cd fireots
if (!(Test-Path vcpkg)) { git clone https://github.com/microsoft/vcpkg.git vcpkg; & vcpkg\bootstrap-vcpkg.bat }
setx VCPKG_ROOT "$PWD\vcpkg"
./build_windows.ps1 -Config release
```
Presets: `windows-release`, `windows-debug`, `windows-release-asan`.
Binary: `build/windows-release/fireots.exe`.

### Tests
```
cmake --preset linux-debug && cmake --build linux-debug
ctest --preset linux-debug
```
Other: `ctest --preset windows-debug`, `ctest --preset macos-debug`.

## Features
- Modular C++20 architecture
- Dependency Injection (Boost.DI)
- LuaJIT scripting bindings
- ASIO multi-thread networking
- MariaDB database layer
- Optional metrics subsystem
- Datapack validation

## Contributing
1. Open an Issue for bugs or proposals.
2. Keep PRs focused.
3. Coordinate map/datapack changes on Discord.
4. Follow formatting + guidelines.
5. Provide rationale for gameplay modifications.

License: GPL-2.0 (upstream attribution retained).

## Support
Discord: https://discord.gg/gvTj5sh9Mp
Docs/Wiki: Fireots docs WIP.

## Special Thanks
Upstream contributors (Canary / OTServBR-Global) and JetBrains (open-source licenses).

## Windows Notes
- Flags: `/W4 /permissive- /Zc:preprocessor /MP /Zc:__cplusplus`
- `_WIN32_WINNT=0x0A00` defined
- Install CMake if missing (`winget install cmake`).

## Troubleshooting
| Issue | Resolution |
|-------|------------|
| Missing headers | Verify `VCPKG_ROOT` & preset |
| MariaDB link errors | Match vcpkg triplet static/dynamic |
| Silent Lua failure | Enable `logLevel = "debug"` |
| Startup crash | Check `dataPackDirectory` & migrations |

## Security
Upstream security fixes merged (KV lock ordering, combat checks, Lua safety). Report issues with repro steps.

## Metrics
Enable: `FEATURE_METRICS=ON`, run stack in `metrics/`.

## License
GPL-2.0 — see `LICENSE`.
