# x86_64 Mac-specific configuration
{
  darwin,
  home-manager,
  nixpkgs,
  overlays,
  labyrinth-variant,
  ...
}: {
  system = "x86_64-darwin";
  overlays = overlays.base;
  userConfig = import ../../modules/home-manager/home {
    pkgs = import nixpkgs {
      system = "x86_64-darwin";
      overlays = overlays.base;
    };
    inherit labyrinth-variant;
  };
  extraModules = [../../modules/darwin/home.nix];
}
