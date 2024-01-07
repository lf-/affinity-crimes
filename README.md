# affinity crimes

This repo makes Affinity Designer allegedly work on Linux, allegedly. Or so it
is claimed. It seems to crash a lot.

Based on: https://codeberg.org/Wanesty/affinity-wine-docs

## Howto

```
nix build .#env -o wine
```

Copy `C:\Windows\System32\WinMetadata` from a Windows computer to `license_violations/WinMetadata`.

```
./setup.sh
```

Install it

```
./affinity.sh ./affinity-designer-msi-2.3.0.exe
```

Run it

```
./affinity.sh wine ~/.local/share/wineAffinity/drive_c/Program\ Files/Affinity/Designer\ 2/Designer.exe
```
