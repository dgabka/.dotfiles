# aarch64 Work-specific configuration
{
  darwin,
  home-manager,
  nixpkgs,
  overlays,
  labyrinth-variant,
  ...
}: {
  system = "aarch64-darwin";
  overlays = overlays.base;
  userConfig = import ../../modules/home-manager/work {
    pkgs = import nixpkgs {
      system = "aarch64-darwin";
      overlays = overlays.base;
    };
    inherit labyrinth-variant;
  };
  extraModules = [];
}
