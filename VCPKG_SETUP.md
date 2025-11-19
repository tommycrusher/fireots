# vcpkg Setup Instructions

## Environment Variable Required

Both Linux and Windows builds now use the `VCPKG_ROOT` environment variable instead of hardcoded paths in `CMakePresets.json`.

## Linux/Ubuntu Setup

```bash
# Set VCPKG_ROOT environment variable
export VCPKG_ROOT=/var/www/vhosts/fireots.pl/vcpkg

# If vcpkg doesn't exist, install it:
cd /var/www/vhosts/fireots.pl
git clone https://github.com/microsoft/vcpkg.git
./vcpkg/bootstrap-vcpkg.sh

# Add to ~/.bashrc for persistence:
echo 'export VCPKG_ROOT=/var/www/vhosts/fireots.pl/vcpkg' >> ~/.bashrc

# Then compile:
./recompile.sh
```

## Windows Setup

```powershell
# Set VCPKG_ROOT environment variable
$env:VCPKG_ROOT = "C:\vcpkg_fireots"

# If vcpkg doesn't exist, install it:
cd C:\
git clone https://github.com/microsoft/vcpkg.git vcpkg_fireots
.\vcpkg_fireots\bootstrap-vcpkg.bat

# Set permanently (optional):
[System.Environment]::SetEnvironmentVariable('VCPKG_ROOT', 'C:\vcpkg_fireots', 'User')

# Then compile:
cmake --preset windows-release
cmake --build build/windows-release --config Release
```

## Why This Change?

Previously, `CMakePresets.json` had a hardcoded Windows path (`C:/vcpkg_fireots/...`) that broke Linux builds. Now both platforms use the flexible `$env{VCPKG_ROOT}` variable from the base preset.

## Troubleshooting

**Error: "Could not find toolchain file"**
- Ensure `VCPKG_ROOT` is set: `echo $VCPKG_ROOT` (Linux) or `echo $env:VCPKG_ROOT` (Windows)
- Verify vcpkg exists at that path
- Verify `scripts/buildsystems/vcpkg.cmake` exists in the vcpkg directory

**vcpkg integration issues**
- Run `vcpkg integrate install` to register vcpkg system-wide
- Ensure vcpkg is bootstrapped (`bootstrap-vcpkg.sh` or `bootstrap-vcpkg.bat`)
