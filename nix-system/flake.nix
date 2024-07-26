{
  description = "my minimal flake";
  inputs = {
    # Main package source
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # Manages link to home dir
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Controles system level software and configuration
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    # NeoVim Nightly
    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";
    neovim-nightly.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = {
    nixpkgs,
    darwin,
    home-manager,
    neovim-nightly,
    ...
  }: let
    labyrinth-variant = "mist";
    overlays = [neovim-nightly.overlays.default];
  in {
    darwinConfigurations.Mac = let
      pkgs = import nixpkgs {
        system = "x86_64-darwin";
        overlays = overlays;
      };
    in
      darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        pkgs = pkgs;
        modules = [
          ./darwin
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.dgabka = import ./home {
                inherit pkgs;
                inherit labyrinth-variant;
              };
            };
          }
        ];
      };
    darwinConfigurations.WHM5006336 = let
      pkgs = import nixpkgs {
        system = "aarch64-darwin";
        overlays = overlays;
      };
    in
      darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        pkgs = pkgs;
        modules = [
          ./darwin
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.dgabka = import ./work {
                inherit pkgs;
                inherit labyrinth-variant;
              };
            };
          }
        ];
      };
  };
}
