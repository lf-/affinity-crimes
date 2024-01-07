#!/usr/bin/env bash
# https://codeberg.org/Wanesty/affinity-wine-docs
set -eu

selfpath=$(realpath "$(dirname "$0")")
wineEnv="$selfpath/wine"

./affinity.sh wineboot --init
# FIXME: fix in wine packaging
./affinity.sh wine "$wineEnv/share/wine/mono/wine-mono-8.1.0-x86.msi"
./affinity.sh winetricks -q dotnet48 corefonts
./affinity.sh wine winecfg -v win11
# grab from a real windows computer
cp -r "$selfpath/license_violations/WinMetadata" "$WINEPREFIX/drive_c/windows/system32/"
