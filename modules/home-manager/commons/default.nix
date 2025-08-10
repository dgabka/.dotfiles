{
  pkgs,
  labyrinth-variant,
  ...
}: {
  imports = [
    ./alacritty.nix
    ./bat.nix
    ./fzf.nix
    ./starship.nix
    ./tmux.nix
    ./zsh.nix
  ];
  home.stateVersion = "24.05";
  home.packages = with pkgs; [
    # common tools
    curl
    tree-sitter
    neovim
    jq
    tree
    stow
    htop
    tmux-sessionizer

    # language tools, LSPs, formatters, etc...
    # nix
    nil
    alejandra
    # lua
    luajitPackages.luacheck
    lua-language-server
    stylua
    # yaml
    yaml-language-server
    yamlfmt
    # shell tools
    nodePackages_latest.bash-language-server
    shellcheck
    shfmt
    # javascript tools
    vtsls
    typescript
    eslint_d
    prettierd
    vscode-langservers-extracted
    # other
    marksman
    dockerfile-language-server-nodejs

    # dev tools
    nodejs
    pre-commit
    docker
    devbox
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
    TERM = "alacritty";
    LABYRINTH_VARIANT = labyrinth-variant;
  };
  xdg.enable = true;
  programs.fd = {
    enable = true;
    extraOptions = ["--color=never"];
    hidden = true;
    ignores = [".git/" "node_modules/"];
  };
  programs.ripgrep = {
    enable = true;
    arguments = [
      "--max-columns-preview"
      "--hidden"
      "--glob=!.git/*"
      "--glob=!node_modules/*"
      "--glob=!__snapshots__/*"
      "--glob=!package-lock.json"
      "--glob=!yarn.lock"
      "--glob=!pnpm.lock"
      "--smart-case"
    ];
  };
  programs.git = {
    enable = true;
    aliases = {
      co = "checkout";
      s = "status";
      sw = "switch";
      rb = "rebase";
    };
    extraConfig.pull.rebase = true;
  };
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };
}
