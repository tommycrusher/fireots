# OpenTibia - Fireots

<<<<<<< HEAD
[![GitHub issues](https://img.shields.io/github/issues/tommycrusher/fireots)](https://github.com/tommycrusher/fireots/issues)
[![GitHub pull request](https://img.shields.io/github/issues-pr/tommycrusher/fireots)](https://github.com/tommycrusher/fireots/pulls)
[![Contributors](https://img.shields.io/github/contributors/tommycrusher/fireots.svg?style=flat-square)](https://github.com/tommycrusher/fireots/graphs/contributors)
[![GitHub](https://img.shields.io/github/license/tommycrusher/fireots)](https://github.com/tommycrusher/fireots/blob/master/LICENSE)

![GitHub repo size](https://img.shields.io/github/repo-size/tommycrusher/fireots)

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=opentibiabr_canary&metric=alert_status)](https://sonarcloud.io/dashboard?id=opentibiabr_canary)

## Builds

=======
[![Discord Channel](https://img.shields.io/discord/528117503952551936.svg?style=flat-square&logo=discord)](https://discord.gg/gvTj5sh9Mp)
>>>>>>> upstream/main
[![Build - Ubuntu](https://github.com/opentibiabr/canary/actions/workflows/build-ubuntu.yml/badge.svg)](https://github.com/opentibiabr/canary/actions/workflows/build-ubuntu.yml)
[![Build - Windows - CMake](https://github.com/opentibiabr/canary/actions/workflows/build-windows-cmake.yml/badge.svg)](https://github.com/opentibiabr/canary/actions/workflows/build-windows-cmake.yml)
[![Build - Windows - Solution](https://github.com/opentibiabr/canary/actions/workflows/build-windows-solution.yml/badge.svg)](https://github.com/opentibiabr/canary/actions/workflows/build-windows-solution.yml)
[![Build - Docker](https://github.com/opentibiabr/canary/actions/workflows/build-docker.yml/badge.svg)](https://github.com/opentibiabr/canary/actions/workflows/build-docker.yml)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=opentibiabr_canary&metric=alert_status)](https://sonarcloud.io/dashboard?id=opentibiabr_canary)
![GitHub repo size](https://img.shields.io/github/repo-size/opentibiabr/canary)
[![GitHub](https://img.shields.io/github/license/opentibiabr/canary)](https://github.com/opentibiabr/canary/blob/main/LICENSE)

<<<<<<< HEAD
## Docker

`docker pull opentibiabr/canary:latest`<br><br>
[![Automation](https://img.shields.io/docker/cloud/automated/opentibiabr/canary)](https://hub.docker.com/r/opentibiabr/canary)
[![Image Size](https://img.shields.io/docker/image-size/opentibiabr/canary)](https://hub.docker.com/r/opentibiabr/canary/tags?page=1&ordering=last_updated)
![Pulls](https://img.shields.io/docker/pulls/opentibiabr/canary)
[![Build](https://img.shields.io/docker/cloud/build/opentibiabr/canary)](https://hub.docker.com/r/opentibiabr/canary/builds)

## Project

OpenTibia - Fireots is a free and open-source MMORPG server emulator written in C++.

It is a fork of the [OTServBR-Global](https://github.com/opentibiabr/otservbr-global) project. You can see the
repository history in the [releases](https://github.com/opentibiabr/otservbr-global/releases/).

This project was created with the intention of being a base as clean as possible, to work as an MMORPG engine and not
necessarily linked to Tibia Global, although it will also work. The OpenTibia - Global was adapted to work with the
source of the Fire, so that it will be the first repository to use this engine.

To connect to the server and to take a stable experience, you can
use [mehah's otclient](https://github.com/mehah/otclient)
=======
OpenTibiaBR - Canary is a free and open-source MMORPG server emulator written in C++. It is a fork of the [OTServBR-Global](https://github.com/opentibiabr/otservbr-global) project. To connect to the server and to take a stable experience, you can use [mehah's otclient](https://github.com/mehah/otclient)
>>>>>>> upstream/main
or [tibia client](https://github.com/dudantas/tibia-client/releases/latest) and if you want to edit something, check
our [customized tools](https://docs.opentibiabr.com/opentibiabr/downloads/tools). If you want to edit the map, use our own [remere's map editor](https://github.com/opentibiabr/remeres-map-editor/).

## Getting Started

- [Gitbook](https://docs.opentibiabr.com/opentibiabr/projects/canary).
- [Wiki](https://github.com/opentibiabr/canary/wiki).

## Running Tests

<<<<<<< HEAD
* [Documentation](docs/wiki/) - Getting started guides, migration, datapack documentation
* [Build Setup](BUILD_SETUP.md) - Complete guide for building Fireots
* [Gitbook](https://docs.fireots.pl/projects/fireots) - External documentation portal
=======
Tests can be run directly from the repository root using CMake test presets:
>>>>>>> upstream/main

```bash
# Configure and build tests for your platform
cmake --preset linux-debug && cmake --build --preset linux-debug

<<<<<<< HEAD
We use the [issue tracker on GitHub](https://github.com/tommycrusher/fireots/issues). Keep in mind that everyone who is
watching the repository gets notified by e-mail when there is an activity, so be thoughtful and avoid writing comments
that aren't meant for an issue (e.g. "+1"). If you'd like for an issue to be fixed faster, you should either fix it
yourself and submit a pull request, or place a bounty on the issue.
=======
# Run all tests
ctest --preset linux-debug
>>>>>>> upstream/main

# For other platforms use:
# ctest --preset macos-debug
# ctest --preset windows-debug
```

<<<<<<< HEAD
Before [creating a pull request](https://github.com/tommycrusher/fireots/pulls) please keep in mind:

* Do not send Pull Request changing the map, as we can't review the changes it's better to use
  our [Discord] to talk about or send the map changes to the responsible for updating it.
* Focus on fixing only one thing, mixing too much things on the same Pull Request make it harder to review, harder to
  test and if we need to revert the change it will remove other things together.
* Follow the project indentation, if your editor support you can use the [editorconfig](https://editorconfig.org/) to
  automatic configure the indentation.
* There are people that doesn't play the game on the official server, so explain your changes to help understand what
  are you changing and why.
* Avoid opening a Pull Request to just update one line of an xml file.
=======
For detailed testing information including adding tests and framework usage, see [tests/README.md](tests/README.md).

## Support
>>>>>>> upstream/main

If you need help, please visit our [discord](https://discord.gg/gvTj5sh9Mp). Our issue tracker is not a support forum, and using it as one will result in your issue being closed.

<<<<<<< HEAD
* Fireots partners
* OpenTibiaBR crew (majesty, gpedro, eduardo dantas, foot)
* [our contributors](https://github.com/opentibiabr/canary/graphs/contributors)
* [fear lucien](https://github.com/FearLucien)
* [cjaker](https://github.com/Eternal-Scripts)
* [slavidodo](https://github.com/slavidodo)
* [mignari and our awesome tools](https://github.com/ottools)
* [mattyx14/otxserver](https://github.com/mattyx14/otxserver) and contributors
* [otland/forgottenserver](https://github.com/otland/forgottenserver) and contributors
* [saiyansking/optimized_forgottenserver](https://github.com/SaiyansKing/optimized_forgottenserver) and contributors
* if we forget someone, we apologize by forgot you. but you know, **forgot**tenserver.
=======
## Contributing
>>>>>>> upstream/main

Here are some ways you can contribute:

<<<<<<< HEAD
See our [donate page](https://fireots.com/home/donate)
=======
- [Issue Tracker](https://github.com/opentibiabr/canary/issues/new/choose).
- [Pull Request](https://github.com/opentibiabr/canary/pulls).

You are subject to our code of conduct, read at [this link](https://github.com/opentibiabr/canary/blob/main/CODE_OF_CONDUCT.md).

## Special Thanks

- Our contributors ([Canary](https://github.com/opentibiabr/canary/graphs/contributors) | [OTServBR-Global](https://github.com/opentibiabr/otservbr-global/graphs/contributors)).

## Sponsors

See our [donate page](https://docs.opentibiabr.com/home/donate).
>>>>>>> upstream/main

## Project supported by JetBrains

We extend our heartfelt gratitude to Jetbrains for generously granting us licenses to collaborate on this and various
other open-source initiatives.

<a href="https://jb.gg/OpenSourceSupport/?from=https://github.com/tommycrusher/fireots/">
  <img src="https://resources.jetbrains.com/storage/products/company/brand/logos/jb_beam.svg" alt="JetBrains" width="150" />
</a>

<<<<<<< HEAD
## Project supported by [TNT Cloud](https://tntcloudbr.com.br/)

Thanks for supporting our open-source project with your game cloud hosting services.

<a href="https://tntcloudbr.com.br/">
  <img src="https://tntcloudbr.com.br/logo.png" alt="TNT Cloud - Game Hosting" width="300" />
</a>

### Partners
=======
## Partners
>>>>>>> upstream/main

[![Comming soon]


Commands how to build:
sudo apt update && sudo apt upgrade -y
sudo apt install git cmake build-essential autoconf libtool ca-certificates curl zip unzip tar pkg-config ninja-build ccache linux-headers-$(uname -r)

Update cmake:

sudo apt remove --purge cmake
hash -r
sudo apt install snapd
sudo snap install cmake --classic
cmake --version

-

sudo apt install acl
cd ~

git clone https://github.com/microsoft/vcpkg
cd vcpkg
./bootstrap-vcpkg.sh
cd ~

git clone --depth 1 https://github.com/tommycrusher/fireots.git
sudo setfacl -R -m g:www-data:rx /home/$USER/
sudo setfacl -R -m g:www-data:rx /home/$USER/canary
sudo chmod -R 755 canary
cd canary
mv config.lua.dist config.lua
mkdir build && cd build

cmake -DCMAKE_TOOLCHAIN_FILE=~/fireots/vcpkg/scripts/buildsystems/vcpkg.cmake .. --preset linux-release
cmake --build linux-release

cd ~
cd canary
ln -r -s build/linux-release/bin/canary .
sudo chmod +x canary
