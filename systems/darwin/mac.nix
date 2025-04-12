# x86_64 Mac-specific configuration
{
  darwin,
  home-manager,
  nixpkgs,
  overlays,
  labyrinth-variant,
  ...
}: let
  pkgs = import nixpkgs {
    system = "x86_64-darwin";
    overlays = overlays.base;
  };
in {
  system = "x86_64-darwin";
  userConfig = import ../../modules/home-manager/home {
    inherit labyrinth-variant pkgs;
  };
  extraModules = [../../modules/darwin/home.nix];
  inherit pkgs darwin home-manager labyrinth-variant;
}
