{
  description = "SirNocturne's standalone nvf Neovim configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nvf, ... }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in {
      # `nix run .#` (or `nix run github:<you>/nvim-config`) works on any machine with Nix.
      packages = forAllSystems (system: {
        default =
          (nvf.lib.neovimConfiguration {
            pkgs = nixpkgs.legacyPackages.${system};
            modules = [ ./config.nix ];
          }).neovim;
      });
    };
}
