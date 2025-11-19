Param(
    [ValidateSet('release','debug','asan')][string]$Config = 'release'
)

Write-Host "[Fireots] Windows build starting..." -ForegroundColor Cyan

function Ensure-Tool {
    Param([string]$Name, [string]$WingetId)
    if (Get-Command $Name -ErrorAction SilentlyContinue) { return $true }
    # Try common install locations (CMake)
    if ($Name -eq 'cmake') {
        $cmakeExe = Join-Path ${env:ProgramFiles} 'CMake\bin\cmake.exe'
        if (Test-Path $cmakeExe) {
            $env:Path = (Split-Path $cmakeExe) + ";" + $env:Path
            if (Get-Command cmake -ErrorAction SilentlyContinue) { return $true }
        }
    }
    if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
        Write-Host "'$Name' not found and winget unavailable. Please install $Name and re-run." -ForegroundColor Red
        return $false
    }
    Write-Host "Installing $Name via winget (user scope)..." -ForegroundColor Yellow
    winget install --id $WingetId -e --silent --scope user | Out-Null
    if (Get-Command $Name -ErrorAction SilentlyContinue) { return $true }
    Write-Host "Retry installing $Name via winget (machine scope)..." -ForegroundColor Yellow
    winget install --id $WingetId -e --silent | Out-Null
    if (Get-Command $Name -ErrorAction SilentlyContinue) { return $true }
    Write-Host "Failed to auto-install $Name. Install manually and retry." -ForegroundColor Red
    return $false
}

# Git
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host 'Git not found in PATH.' -ForegroundColor Red
    exit 1
}

# CMake (required) & Ninja (optional)
$okCmake = Ensure-Tool -Name 'cmake' -WingetId 'Kitware.CMake'
$null = Ensure-Tool -Name 'ninja' -WingetId 'Ninja-build.Ninja'
if (-not $okCmake) { exit 1 }

# Visual Studio Build Tools detection
$vsPath = $null
try {
    $vswhere = Join-Path ${env:ProgramFiles(x86)} 'Microsoft Visual Studio\Installer\vswhere.exe'
    if (Test-Path $vswhere) {
        $vsPath = & $vswhere -latest -products * -requires Microsoft.Component.MSBuild -property installationPath -nologo
    }
} catch {}
if (-not $vsPath) {
    Write-Host 'Visual Studio Build Tools not detected. Attempting installation via winget...' -ForegroundColor Yellow
    if (Get-Command winget -ErrorAction SilentlyContinue) {
        # Install core Build Tools (user may need to accept agreements)
        winget install --id Microsoft.VisualStudio.2022.BuildTools -e --silent | Out-Null
        # Re-check
        try {
            if (Test-Path $vswhere) { $vsPath = & $vswhere -latest -products * -requires Microsoft.Component.MSBuild -property installationPath -nologo }
        } catch {}
    }
}
if (-not $vsPath) {
    Write-Host 'Please install Visual Studio 2022 Build Tools (C++ workload) and re-run.' -ForegroundColor Red
    exit 1
}

# VCPKG
if (-not $env:VCPKG_ROOT) {
    $defaultVcpkg = Join-Path $env:LOCALAPPDATA 'fireots\vcpkg'
    Write-Host "VCPKG_ROOT not set. Using $defaultVcpkg" -ForegroundColor Yellow
    $env:VCPKG_ROOT = $defaultVcpkg
}
if (-not (Test-Path $env:VCPKG_ROOT)) {
    Write-Host "Cloning vcpkg into $env:VCPKG_ROOT" -ForegroundColor Cyan
    git clone https://github.com/microsoft/vcpkg "$env:VCPKG_ROOT"
    if ($LASTEXITCODE -ne 0) { Write-Host 'vcpkg clone failed.' -ForegroundColor Red; exit $LASTEXITCODE }
    & "$env:VCPKG_ROOT\bootstrap-vcpkg.bat"
    if ($LASTEXITCODE -ne 0) { Write-Host 'vcpkg bootstrap failed.' -ForegroundColor Red; exit $LASTEXITCODE }
}

# Map config -> preset
$Preset = switch ($Config) {
    'release' { 'windows-release' }
    'debug'   { 'windows-debug' }
    'asan'    { 'windows-release-asan' }
}
Write-Host "Using preset: $Preset" -ForegroundColor Cyan

# Configure
cmake --preset $Preset
if ($LASTEXITCODE -ne 0) { Write-Host 'CMake configure failed.' -ForegroundColor Red; exit $LASTEXITCODE }

# Build
cmake --build "build/$Preset" --target fireots --parallel
if ($LASTEXITCODE -ne 0) { Write-Host 'Build failed.' -ForegroundColor Red; exit $LASTEXITCODE }

# Result
$exe = Join-Path $PWD "build/$Preset/bin/fireots.exe"
if (Test-Path $exe) {
    Write-Host "Build success: $exe" -ForegroundColor Green
} else {
    Write-Host 'Executable not found (expected in bin/). Check CMake output.' -ForegroundColor Yellow
}
