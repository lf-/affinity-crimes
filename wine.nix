{ wineWow64Packages, fetchFromGitLab }:
let
  wineUnstable = wineWow64Packages.full.override (old: {
    wineRelease = "unstable";
  });
in
wineUnstable.overrideAttrs (old: {
  # https://gitlab.winehq.org/ElementalWarrior/wine/-/commits/affinity-photo3-wine9.13-part3
  src = fetchFromGitLab {
    domain = "gitlab.winehq.org";
    owner = "elementalwarrior";
    repo = "wine";
    rev = "a7c9b19e1a26cf49c63a7c19189a3e2bbe2c6ac2";
    hash = "sha256-XVhz9p2kgFBoJ376vg8OaFXxcMEjAe9AK1hk0I1rb1Q=";
  };
  version = "9.13";
})
