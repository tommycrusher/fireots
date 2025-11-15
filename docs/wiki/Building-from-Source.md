# Building Fireots from Source

This guide provides detailed instructions for building Fireots on different platforms with various configurations.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Linux Build](#linux-build)
- [Windows Build](#windows-build)
- [macOS Build](#macos-build)
- [Build Configurations](#build-configurations)
- [Troubleshooting](#troubleshooting)

## Prerequisites

### All Platforms

- **Git**: Version control
- **CMake**: 3.22 or higher
- **vcpkg**: C++ package manager
- **C++20 Compiler**:
  - Linux: GCC 11+ or Clang 14+
  - Windows: Visual Studio 2022 (MSVC 19.30+)
  - macOS: Clang 14+ (Xcode 14+)

### Dependencies (automatically managed by vcpkg)

Fireots uses vcpkg to automatically download and build the following dependencies:

- **asio** - Asynchronous networking
- **boost-di** - Dependency injection
- **fmt** - String formatting
- **luajit** - Lua scripting engine
- **libmariadb** - MySQL/MariaDB client
- **parallel-hashmap** - High-performance hashmap
- **magic-enum** - Enum reflection
- **protobuf** - Protocol buffers
- **pugixml** - XML parsing
- **spdlog** - Logging library
- **curl** - HTTP client (optional, for metrics)

All dependencies and versions are defined in `vcpkg.json`.

---

## Linux Build

### Ubuntu/Debian Setup

#### 1. Install System Dependencies

```bash
sudo apt-get update
sudo apt-get install -y \
    git cmake ninja-build \
    build-essential pkg-config \
    python3 \
    libmariadb-dev mariadb-server
```

#### 2. Install vcpkg

```bash
cd ~
git clone https://github.com/Microsoft/vcpkg.git
cd vcpkg
./bootstrap-vcpkg.sh
export VCPKG_ROOT=$HOME/vcpkg
echo 'export VCPKG_ROOT=$HOME/vcpkg' >> ~/.bashrc
```

#### 3. Clone Fireots

```bash
git clone https://github.com/tommycrusher/fireots.git
cd fireots
```

#### 4. Build with CMake Presets

**Release Build (recommended for production):**
```bash
./recompile.sh ~/vcpkg linux-release
```

**Debug Build (with debugging symbols):**
```bash
cmake --preset linux-debug -DCMAKE_TOOLCHAIN_FILE=$HOME/vcpkg/scripts/buildsystems/vcpkg.cmake
cmake --build --preset linux-debug
```

**RelWithDebInfo Build (optimized + debug symbols):**
```bash
cmake --preset linux-relwithdebinfo -DCMAKE_TOOLCHAIN_FILE=$HOME/vcpkg/scripts/buildsystems/vcpkg.cmake
cmake --build --preset linux-relwithdebinfo
```

#### 5. Executable Location

After successful build:
- **Release**: `./fireots` (copied to project root by recompile.sh)
- **Debug**: `build/linux-debug/bin/fireots`
- **RelWithDebInfo**: `build/linux-relwithdebinfo/bin/fireots`

### Arch Linux

```bash
sudo pacman -S git cmake ninja gcc mariadb python
# Follow vcpkg and build steps above
```

### Fedora/RHEL

```bash
sudo dnf install git cmake ninja-build gcc-c++ mariadb-devel mariadb-server python3
# Follow vcpkg and build steps above
```

---

## Windows Build

### Visual Studio 2022 Setup

#### 1. Install Visual Studio 2022

Download and install [Visual Studio 2022 Community Edition](https://visualstudio.microsoft.com/downloads/).

**Required Workloads**:
- Desktop development with C++

**Required Components**:
- MSVC v143 - VS 2022 C++ x64/x86 build tools
- C++ CMake tools for Windows
- Windows 10/11 SDK

#### 2. Install Git

Download and install [Git for Windows](https://git-scm.com/download/win).

#### 3. Install vcpkg

Open PowerShell as Administrator:

```powershell
cd C:\
git clone https://github.com/Microsoft/vcpkg.git
cd vcpkg
.\bootstrap-vcpkg.bat

# Set environment variable permanently
[System.Environment]::SetEnvironmentVariable('VCPKG_ROOT', 'C:\vcpkg', 'User')
```

#### 4. Clone Fireots

```powershell
cd C:\Projects  # or your preferred directory
git clone https://github.com/tommycrusher/fireots.git
cd fireots
```

#### 5. Build with CMake

Open **Developer Command Prompt for VS 2022** or **Developer PowerShell for VS 2022**:

**Release Build:**
```cmd
cmake --preset windows-release -DCMAKE_TOOLCHAIN_FILE=C:\vcpkg\scripts\buildsystems\vcpkg.cmake
cmake --build --preset windows-release
```

**Debug Build:**
```cmd
cmake --preset windows-debug -DCMAKE_TOOLCHAIN_FILE=C:\vcpkg\scripts\buildsystems\vcpkg.cmake
cmake --build --preset windows-debug
```

#### 6. Executable Location

- **Release**: `build\windows-release\bin\Release\fireots.exe`
- **Debug**: `build\windows-debug\bin\Debug\fireots.exe`

### Alternative: Visual Studio GUI

1. Open Visual Studio 2022
2. **File → Open → CMake** → Select `CMakeLists.txt` in fireots directory
3. VS will automatically detect CMake presets
4. Select preset from dropdown: `windows-release` or `windows-debug`
5. **Build → Build All** (Ctrl+Shift+B)

---

## macOS Build

### Xcode and Homebrew Setup

#### 1. Install Xcode Command Line Tools

```bash
xcode-select --install
```

#### 2. Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### 3. Install Dependencies

```bash
brew install git cmake ninja pkg-config mariadb python3
brew services start mariadb
```

#### 4. Install vcpkg

```bash
cd ~
git clone https://github.com/Microsoft/vcpkg.git
cd vcpkg
./bootstrap-vcpkg.sh
export VCPKG_ROOT=$HOME/vcpkg
echo 'export VCPKG_ROOT=$HOME/vcpkg' >> ~/.zshrc
```

#### 5. Clone and Build

```bash
git clone https://github.com/tommycrusher/fireots.git
cd fireots
./recompile.sh ~/vcpkg linux-release
```

**Note**: macOS uses the `linux-release` preset as it's Unix-based.

---

## Build Configurations

### CMake Presets

Fireots provides predefined CMake presets in `CMakePresets.json`:

| Preset | Platform | Optimization | Debug Info | Use Case |
|--------|----------|--------------|------------|----------|
| `linux-release` | Linux/macOS | `-O3 -flto` | No | Production servers |
| `linux-debug` | Linux/macOS | `-O0` | Yes | Development, debugging |
| `linux-relwithdebinfo` | Linux/macOS | `-O2` | Yes | Profiling, crash analysis |
| `linux-test` | Linux/macOS | `-O0` | Yes | Running unit tests |
| `windows-release` | Windows | `/O2 /GL` | No | Production servers |
| `windows-debug` | Windows | `/Od` | Yes | Development, debugging |

### Custom Build Options

You can customize the build with CMake options:

#### Enable ccache (faster rebuilds)

```bash
cmake --preset linux-release -DOPTIONS_ENABLE_CCACHE=ON
```

#### Enable sccache

```bash
cmake --preset linux-release -DOPTIONS_ENABLE_SCCACHE=ON
```

#### Disable IPO/LTO

```bash
cmake --preset linux-release -DOPTIONS_ENABLE_IPO=OFF
```

#### Build with tests

```bash
cmake --preset linux-test -DBUILD_TESTS=ON
cmake --build --preset linux-test
ctest --preset linux-test --verbose
```

#### Enable metrics feature

```bash
cmake --preset linux-release -DFEATURE_METRICS=ON
```

### Manual CMake Build (without presets)

If you need full control:

```bash
mkdir build && cd build

cmake .. \
  -G Ninja \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_TOOLCHAIN_FILE=$VCPKG_ROOT/scripts/buildsystems/vcpkg.cmake \
  -DOPTIONS_ENABLE_IPO=ON \
  -DBUILD_TESTS=OFF

ninja
```

---

## Troubleshooting

### vcpkg Issues

#### "vcpkg command not found"

```bash
export VCPKG_ROOT=$HOME/vcpkg
export PATH=$PATH:$VCPKG_ROOT
```

#### vcpkg downloads fail

```bash
cd $VCPKG_ROOT
git pull
./bootstrap-vcpkg.sh  # or .\bootstrap-vcpkg.bat on Windows
```

#### Clear vcpkg cache

```bash
rm -rf $VCPKG_ROOT/buildtrees
rm -rf $VCPKG_ROOT/packages
```

### CMake Errors

#### "Could not find CMake"

**Linux:**
```bash
sudo apt-get install cmake  # Ubuntu/Debian
```

**macOS:**
```bash
brew install cmake
```

**Windows:**
Download from https://cmake.org/download/

#### "Ninja not found"

**Linux:**
```bash
sudo apt-get install ninja-build
```

**macOS:**
```bash
brew install ninja
```

**Windows:**
Ninja is included with Visual Studio 2022.

### Compiler Errors

#### "C++20 required"

Ensure you have:
- Linux: GCC 11+ or Clang 14+
- Windows: Visual Studio 2022
- macOS: Xcode 14+

Check compiler version:
```bash
g++ --version  # Linux
clang++ --version  # macOS
```

#### LuaJIT linking errors on Linux ARM

Set environment variable before building:
```bash
export VCPKG_FORCE_SYSTEM_BINARIES=1
```

### Build Performance

#### Slow initial build

First build downloads and compiles all dependencies (~10-20 minutes). Subsequent builds are much faster.

Use ccache for faster incremental builds:
```bash
sudo apt-get install ccache  # Linux
brew install ccache  # macOS

cmake --preset linux-release -DOPTIONS_ENABLE_CCACHE=ON
```

#### Parallel builds

Ninja automatically uses all CPU cores. For Make:
```bash
make -j$(nproc)  # Linux/macOS
```

### Runtime Issues

#### "libmariadb.so not found" (Linux)

```bash
sudo apt-get install libmariadb-dev
sudo ldconfig
```

#### "Missing DLL" (Windows)

Ensure all DLLs from `build\windows-release\bin\Release\` are in the same directory as `fireots.exe`.

---

## Advanced Topics

### Cross-Compilation

Not officially supported, but possible with custom CMake toolchain files.

### Static Linking

vcpkg builds static libraries by default. For shared libraries:
```bash
export VCPKG_DEFAULT_TRIPLET=x64-linux-dynamic  # Linux
```

### Custom vcpkg Triplet

Create custom triplet in `vcpkg/triplets/` for specialized builds (e.g., ARM).

---

## Continuous Integration

Fireots can be built in CI/CD pipelines:

### GitHub Actions Example

```yaml
- name: Install vcpkg
  run: |
    git clone https://github.com/Microsoft/vcpkg.git
    cd vcpkg && ./bootstrap-vcpkg.sh

- name: Build Fireots
  run: |
    export VCPKG_ROOT=$PWD/vcpkg
    ./recompile.sh $VCPKG_ROOT linux-release
```

### Docker Build

See `docker/Dockerfile.dev` for containerized build example.

---

## Getting Help

- **Build Issues**: [GitHub Issues](https://github.com/tommycrusher/fireots/issues)
- **Documentation**: [Fireots Wiki](https://github.com/tommycrusher/fireots/wiki)
- **Discussions**: [GitHub Discussions](https://github.com/tommycrusher/fireots/discussions)

---

**Last Updated**: November 15, 2025
**Fireots Version**: 1.5.0-rebrand
