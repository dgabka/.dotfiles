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

    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.url = "github:numtide/flake-utils";

    selfhosted = {
      url = "git+file:modules/terminus/selfhosted?ref=main";
      flake = false;
    };
  };
  outputs = {
    nixpkgs,
    darwin,
    home-manager,
    neovim-nightly,
    rust-overlay,
    flake-utils,
    ...
  }: let
    # Global configuration
    labyrinth-variant = "mist";

    # Import modular components
    overlays = import ./overlays.nix {
      inherit nixpkgs neovim-nightly rust-overlay;
    };

    # System configurations
    systemConfigs = {
      darwinConfigurations.Mac = import ./systems/darwin/default.nix (
        import ./systems/darwin/mac.nix {
          inherit darwin home-manager nixpkgs overlays labyrinth-variant;
        }
      );

      darwinConfigurations.WHM5006336 = import ./systems/darwin/default.nix (
        import ./systems/darwin/work.nix {
          inherit darwin home-manager nixpkgs overlays labyrinth-variant;
        }
      );

      nixosConfigurations.terminus =
        (import ./systems/nixos/terminus.nix {
          inherit nixpkgs home-manager overlays labyrinth-variant;
        })
        .nixosSystem;
    };

    # Create per-system outputs using flake-utils
    systemOutputs = flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = overlays.dev;
      };
      shells = import ./shells.nix {inherit pkgs;};
    in {
      # Re-export the shells from the dedicated file
      devShells = shells;
    });
  in
    # Merge the two output sets
    systemConfigs // systemOutputs;
}
