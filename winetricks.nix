{ winetricks, fetchFromGitHub }:
winetricks.overrideAttrs (old: rec {
  src = fetchFromGitHub {
    owner = "Winetricks";
    repo = "winetricks";
    rev = "20250102";
    hash = "sha256-Km2vVTYsLs091cjmNTW8Kqku3vdsEA0imTtZfqZWDQo=";
  };
  version = src.rev;
})
