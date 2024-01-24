#!/usr/bin/env bash

selfpath=$(realpath "$(dirname "$0")")
winepath=$(readlink "$selfpath/wine")
(return 0 2>/dev/null) && sourced=1 || sourced=0

export WINEPREFIX="${WINEPREFIX:-$HOME/.local/share/wineAffinity}"
export PATH="$winepath/bin:$PATH"
export LD_LIBRARY_PATH="$winepath/lib${LD_LIBRARY_PATH:+:}${LD_LIBRARY_PATH:-}"
export WINEDLLOVERRIDES="winemenubuilder.exe=d"
export WINESERVER="$winepath/bin/wineserver"
export WINELOADER="$winepath/bin/wine"
export WINEDLLPATH="$winepath/lib/wine"

if [[ $sourced == 0 ]]; then exec "$@"; fi
