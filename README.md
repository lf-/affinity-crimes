# affinity crimes

This repo makes Affinity Photo and Affinity Designer work on Linux, far better
than they have any right to do, but with some known issues.

It is generally good enough that you can happily do art on Linux, albeit with
some limited set of known warts.

Based on: https://codeberg.org/Wanesty/affinity-wine-docs

## Known issues

- Can't reattach panels to the app window: https://codeberg.org/wanesty/affinity-wine-docs/issues/12
- Settings saving across restarts is broken: https://codeberg.org/wanesty/affinity-wine-docs/issues/11
- Exporting PNGs works properly but breaks/crashes the app afterwards: https://codeberg.org/wanesty/affinity-wine-docs/issues/10

  SVG works fine.
- Possible occasional crashes of unknown cause? I can't remember. Consider
  hitting the save button frequently as one should do in these things anyway.

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

Specifically, use `nixYuri ./affinity.sh [...]`.

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
