#!/usr/bin/env bash

selfpath=$(realpath "$(dirname "$0")")
winepath=$(readlink "$selfpath/wine")

export WINEPREFIX="${WINEPREFIX:-$HOME/.local/share/wineAffinity}"
export PATH="$winepath/bin:$PATH"
export LD_LIBRARY_PATH="$winepath/lib:$LD_LIBRARY_PATH"
export WINEDLLOVERRIDES="winemenubuilder.exe=d"
export WINESERVER="$winepath/bin/wineserver"
export WINELOADER="$winepath/bin/wine"
export WINEDLLPATH="$winepath/lib/wine"

"$@"
