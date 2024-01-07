{ wineWow64Packages, fetchFromGitLab }:
let
  wineUnstable = wineWow64Packages.full.override (old: {
    wineRelease = "unstable";
  });
in
wineUnstable.overrideAttrs (old: {
  src = fetchFromGitLab {
    domain = "gitlab.winehq.org";
    owner = "elementalwarrior";
    repo = "wine";
    rev = "c12ed1469948f764817fa17efd2299533cf3fe1c";
    hash = "sha256-eMN4SN8980yteYODN2DQIVNEJMsGQE8OIdPs/7DbvqQ=";
  };
  version = "8.14";
})
