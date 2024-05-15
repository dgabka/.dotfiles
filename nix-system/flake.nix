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
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };
  outputs =
    inputs @ { nixpkgs
    , darwin
    , home-manager
    , ...
    }: {
      darwinConfigurations.Mac = darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        pkgs = import nixpkgs {
          system = "x86_64-darwin";
          overlays = [
            inputs.neovim-nightly-overlay.overlay
          ];
        };
        modules = [
          ./darwin
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.dgabka = ./home;
            };
          }
        ];
      };
      darwinConfigurations.WHM5006336 = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        pkgs = import nixpkgs {
          system = "aarch64-darwin";
          overlays = [
            inputs.neovim-nightly-overlay.overlay
          ];
        };
        modules = [
          ./darwin
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.dgabka = ./work;
            };
          }
        ];
      };
    };
}
