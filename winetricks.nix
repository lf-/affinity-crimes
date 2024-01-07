{ winetricks, fetchFromGitHub }:
winetricks.overrideAttrs (old: rec {
  src = fetchFromGitHub {
    owner = "Winetricks";
    repo = "winetricks";
    rev = "20240105";
    hash = "sha256-YTEgb19aoM54KK8/IjrspoChzVnWAEItDlTxpfpS52w=";
  };
  version = src.rev;
})
