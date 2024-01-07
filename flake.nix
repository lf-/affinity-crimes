{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/master";

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      wrap = pkgs.callPackage ./wrap.nix { };
    in
    {
      packages.x86_64-linux = rec {
        wine-unwrapped = pkgs.callPackage ./wine.nix { };
        wine-wrapped = wrap { wine = wine-unwrapped; };
        winetricks = pkgs.callPackage ./winetricks.nix {};
        env = pkgs.buildEnv {
          name = "affinity-env";
          paths = [
            wine-wrapped
            winetricks
          ];
        };
      };
    };
}
