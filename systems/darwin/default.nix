# Common configuration for all Darwin (macOS) systems
{
  darwin,
  home-manager,
  nixpkgs,
  system,
  overlays,
  config,
  labyrinth-variant,
  ...
}: let
  pkgs = import nixpkgs {
    inherit system;
    inherit overlays;
  };
in
  darwin.lib.darwinSystem {
    inherit system;
    inherit pkgs;
    modules =
      [
        ../../modules/darwin
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.dgabka = config.userConfig;
          };
        }
      ]
      ++ config.extraModules;
  }
