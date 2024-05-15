{ pkgs, ... }: {
  home.stateVersion = "24.05";
  home.packages = with pkgs; [
    # common tools
    curl
    tree-sitter
    neovim
    jq
    tree
    stow

    # language tools, LSPs, formatters, etc...
    nil # nix language server
    nixpkgs-fmt
    lua-language-server
    stylua
    yaml-language-server
    yamlfmt
    vscode-langservers-extracted

    # dev tools
    devenv
    nodejs
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
    TERM = "alacritty";
  };
  programs.fd = {
    enable = true;
    extraOptions = [ "--color=never" ];
    hidden = true;
    ignores = [ ".git/" "node_modules/" ];
  };
  programs.ripgrep = {
    enable = true;
    arguments = [
      "--max-columns-preview"
      "--hidden"
      "--glob=!.git/*"
      "--glob=!node_modules/*"
      "--glob=!package-lock.json"
      "--glob=!yarn.lock"
      "--glob=!pnpm.lock"
      "--smart-case"
    ];
  };
  programs.bat = import ./bat.nix { inherit pkgs; };
  programs.fzf = import ./fzf.nix;
  programs.git = {
    enable = true;
  };
  programs.starship = import ./starship.nix;
  programs.alacritty = import ./alacritty.nix { inherit pkgs; };
  programs.tmux = import ./tmux.nix { inherit pkgs; };
  programs.zsh = import ./zsh.nix { inherit pkgs; };
}
