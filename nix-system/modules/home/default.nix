({pkgs, ...}: {
  home.stateVersion = "24.05";
  home.packages = with pkgs; [
    # common tools
    ripgrep
    fd
    curl
    pstree

    # language tools, LSPs, formatters, etc...
    alejandra
    nil

    # dev tools
    devenv
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  programs.bat.enable = true;
  programs.fzf = import ./fzf.nix;
  programs.git.enable = true;
  programs.fish = import ./fish.nix {inherit pkgs;};
  programs.starship = import ./starship.nix;
  programs.alacritty = import ./alacritty.nix {inherit pkgs;};
  programs.neovim.enable = true;
  programs.tmux = import ./tmux.nix {inherit pkgs;};
})
