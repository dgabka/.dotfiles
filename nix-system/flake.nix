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
  };
  outputs = inputs: {
    darwinConfigurations.Mac = inputs.darwin.lib.darwinSystem {
      system = "x86_64-darwin";
      pkgs = import inputs.nixpkgs {system = "x86_64-darwin";};
      modules = [
        (
          {pkgs, ...}: {
            programs.bash.enable = true;
            programs.zsh.enable = true;
            programs.fish.enable = true;
            environment.shells = [pkgs.bash pkgs.zsh pkgs.fish];
            environment.loginShell = pkgs.fish;
            nix.extraOptions = ''
              experimental-features = nix-command flakes
            '';
            environment.systemPackages = [pkgs.coreutils];
            fonts.fontDir.enable = false;
            fonts.fonts = [(pkgs.nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono"];})];
            services.nix-daemon.enable = true;
            system.defaults.NSGlobalDomain.InitialKeyRepeat = 14;
            system.defaults.NSGlobalDomain.KeyRepeat = 1;
            system.stateVersion = 4;
          }
        )
        inputs.home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.dgabka.imports = [
              ({pkgs, ...}: {
                home.stateVersion = "23.11";
                home.packages = [pkgs.ripgrep pkgs.fd pkgs.curl];
                home.sessionVariables = {
                  EDITOR = "nvim";
                };
                programs.bat.enable = true;
                programs.bat.config.theme = "base16";
                programs.fzf.enable = true;
                programs.fzf.enableFishIntegration = true;
                programs.fzf.enableBashIntegration = true;
                programs.fzf.enableZshIntegration = true;
                programs.fzf.colors = {
                  "fg" = "#908caa";
                  "bg" = "#232136";
                  "hl" = "#ea9a97";
                  "fg+" = "#e0def4";
                  "bg+" = "#393552";
                  "hl+" = "#ea9a97";
                  "border" = "#44415a";
                  "header" = "#3e8fb0";
                  "gutter" = "#232136";
                  "spinner" = "#f6c177";
                  "info" = "#9ccfd8";
                  "separator" = "#44415a";
                  "pointer" = "#c4a7e7";
                  "marker" = "#eb6f92";
                  "prompt" = "#908caa";
                };
                programs.git.enable = true;
                programs.fish.enable = true;
                programs.fish.plugins = [
                  {
                    name = "fzf";
                    src = pkgs.fetchFromGitHub {
                      owner = "patrickf1";
                      repo = "fzf.fish";
                      rev = "8920367cf85eee5218cc25a11e209d46e2591e7a";
                      sha256 = "1hqqppna8iwjnm8135qdjbd093583qd2kbq8pj507zpb1wn9ihjg";
                    };
                  }
                  {
                    name = "rose-pine";
                    src = pkgs.fetchFromGitHub {
                      owner = "rose-pine";
                      repo = "fish";
                      rev = "38aab5baabefea1bc7e560ba3fbdb53cb91a6186";
                      sha256 = "0bwsq9pz1nlhbr3kyz677prgyk973sgis72xamm1737zqa98c8bd";
                    };
                  }
                ];
                programs.fish.shellAbbrs = {
                  gco = "git checkout";
                  gcob = "git checkout -b";
                  glog = "git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'";
                  gloga = "git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all";
                };
                programs.alacritty.enable = true;
                programs.alacritty.settings = {
                  font.size = 16;
                };
              })
            ];
          };
        }
      ];
    };
  };
}
