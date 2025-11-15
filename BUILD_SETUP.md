# Fireots Build Setup

## Prerequisites Installation (Completed)

### vcpkg Package Manager
vcpkg has been installed in `~/vcpkg/` and bootstrapped.

**Setup commands executed**:
```bash
cd ~
git clone https://github.com/microsoft/vcpkg.git
cd vcpkg
./bootstrap-vcpkg.sh -disableMetrics
```

**Required environment variable**:
```bash
export VCPKG_ROOT=~/vcpkg
```

Add this to your `~/.bashrc` or `~/.zshrc` for persistence:
```bash
echo 'export VCPKG_ROOT=~/vcpkg' >> ~/.bashrc
```

## Building Fireots

### First Time Build
On first build, vcpkg will download and compile all dependencies listed in `vcpkg.json`.
This process takes **30-60 minutes** depending on your system.

**Command**:
```bash
export VCPKG_ROOT=~/vcpkg
./recompile.sh ~ linux-release
```

**Note**: Pass `~` (not `~/vcpkg`) to `recompile.sh` as it appends `/vcpkg` automatically.

### Subsequent Builds
After initial dependency compilation, rebuilds are much faster (1-5 minutes):
```bash
./recompile.sh ~ linux-release
```

## Build Presets

Available CMake presets (from `CMakePresets.json`):

- `linux-release` - Production build (default)
- `linux-debug` - Debug build with ASAN
- `linux-test` - Build with unit tests

## Dependencies

All dependencies are managed via `vcpkg.json`:
- asio - Networking
- pugixml - XML parsing
- spdlog - Logging
- luajit - Lua scripting
- libmariadb - MySQL database
- parallel-hashmap - Fast hashmaps
- magic-enum - Enum reflection
- protobuf - Binary protocol
- boost-di - Dependency injection

## Troubleshooting

### "Could not find toolchain file"
Ensure `VCPKG_ROOT` is set:
```bash
export VCPKG_ROOT=~/vcpkg
```

### "Ninja not found"
Install ninja:
```bash
sudo apt install ninja-build  # Debian/Ubuntu
sudo dnf install ninja-build  # Fedora
```

### First build taking too long
This is normal. vcpkg compiles all dependencies from source.
Subsequent builds reuse the cached binaries.

## Current Status

- ✅ vcpkg installed and bootstrapped
- ✅ Environment variables configured
- 🔄 **First build in progress** (dependencies compiling)
- ⏳ Estimated completion: 30-60 minutes

Last updated: 2025-11-15
