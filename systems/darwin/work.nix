# aarch64 Work-specific configuration
{
  darwin,
  home-manager,
  nixpkgs,
  overlays,
  labyrinth-variant,
  ...
}: let
  pkgs = import nixpkgs {
    system = "aarch64-darwin";
    overlays = overlays.base;
  };
in {
  system = "aarch64-darwin";
  userConfig = import ../../modules/home-manager/work {
    inherit labyrinth-variant pkgs;
  };
  extraModules = [];
  inherit pkgs darwin home-manager labyrinth-variant;
}
