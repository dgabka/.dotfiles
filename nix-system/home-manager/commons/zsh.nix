{pkgs, ...}: {
  enable = true;
  autosuggestion.enable = true;
  enableCompletion = true;
  dotDir = ".config/zsh";
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
    gs = "git status";
    gco = "git checkout";
    gcob = "git checkout -b";
    glog = "git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'";
    gloga = "git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all";
    nr = "darwin-rebuild switch --flake ~/.dotfiles/nix-system";
  };
  syntaxHighlighting = {
    enable = true;
  };
  initExtra = builtins.readFile ./zshExtra.zsh;
}
