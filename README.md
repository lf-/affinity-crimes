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
./affinity.sh wine ./affinity-designer-msi-2.3.0.exe
```

Run it

```
./affinity.sh wine ~/.local/share/wineAffinity/drive_c/Program\ Files/Affinity/Designer\ 2/Designer.exe
```

## Fixes

### Graphics backend

You will undoubtedly benefit from setting the graphics backend, which probably
fixes flickering. I have found that on KDE Wayland on AMD, Vulkan doesn't
flicker but is a little bit laggy. On KDE Wayland on Intel, GL works properly
without flickering or much lag.

Run:

```
./affinity.sh winetricks renderer=vulkan
# or
./affinity.sh winetricks renderer=gl
```

Note that you will need to use [NixGL](https://github.com/nix-community/nixGL)
on non-NixOS hosts or else Affinity will hang, for lack of successfully loading
a graphics driver. Also, you have to use the correct one, either `nixGL` or
`nixVulkan` depending on your graphics backend. If only someone wrote a
[`nixYuri` of both of
them](https://github.com/lf-/dotfiles/blob/main/configs/nix/packages/nixYuri/package.nix).

### Font rendering

Consider running:

```
./affinity.sh winecfg
```

and setting the DPI higher than 96. This will turn on font smoothing as well.

Be aware that it might still look like ~~shit~~ a macOS computer, because there
is no subpixel antialiasing. If you want that, `./affinity.sh winetricks
fontsmooth=rgb` (or `fontsmooth=gray` to revert to the grayscale font
smoothing).

There is still some remaining badness in the font rendering, probably due to
not getting the right fonts and thus the kerning in the UI is still terrible,
but it is usable.
