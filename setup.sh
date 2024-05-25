#!/usr/bin/env bash
# https://codeberg.org/Wanesty/affinity-wine-docs
set -eu

selfpath=$(realpath "$(dirname "$0")")
wineEnv="$selfpath/wine"

source "$selfpath/affinity.sh"

# this crime is required to make wineboot not try to install mono itself
WINEDLLOVERRIDES="mscoree=" wineboot --init
# FIXME: fix in wine packaging
wine msiexec /i "$wineEnv/share/wine/mono/wine-mono-8.1.0-x86.msi"
winetricks -q dotnet48 corefonts vcrun2015
wine winecfg -v win11
# grab from a real windows computer
cp -r "$selfpath/license_violations/WinMetadata" "$WINEPREFIX/drive_c/windows/system32/"
