{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    dotDir = "${config.xdg.configHome}/zsh";
    history.ignorePatterns = ["rm *"];
    history.ignoreAllDups = true;
    historySubstringSearch = {
      enable = true;
      searchDownKey = "^N";
      searchUpKey = "^P";
    };
    shellAliases = {
      ls = "ls --color=auto";
      la = "ls -Alh --color=auto";
      g = "git";
      gc = "git commit";
      gcan = "git commit --amend --no-edit";
      gcann = "git commit --amend --no-edit --no-verify";
      gs = "git status";
      gco = "git checkout";
      gcob = "git checkout -b";
      glog = "git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'";
      gloga = "git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all";
      nr = "darwin-rebuild switch --flake ~/.dotfiles";

      devshell = "nix develop \"github:dgabka/.dotfiles\" -c $SHELL";
      rust-sh = "nix develop \"github:dgabka/.dotfiles#rust\" -c $SHELL";
      node20 = "nix develop \"github:dgabka/.dotfiles#node20\" -c $SHELL";
      node22 = "nix develop \"github:dgabka/.dotfiles#node22\" -c $SHELL";
      node23 = "nix develop \"github:dgabka/.dotfiles#node23\" -c $SHELL";
      node24 = "nix develop \"github:dgabka/.dotfiles#node24\" -c $SHELL";
    };
    syntaxHighlighting = {
      enable = true;
    };
    initContent = builtins.readFile ./zshContent.zsh;
  };
}
