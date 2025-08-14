# Terminus NixOS configuration
{
  nixpkgs,
  home-manager,
  overlays,
  labyrinth-variant,
  ...
}: let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    overlays = overlays.base;
  };
in {
  nixosSystem = nixpkgs.lib.nixosSystem {
    inherit system pkgs;
    modules = [
      ../../modules/terminus/configuration.nix
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.dgabka = import ../../modules/home-manager/terminus {
          inherit pkgs;
          inherit labyrinth-variant;
        };
      }
    ];
  };
}
