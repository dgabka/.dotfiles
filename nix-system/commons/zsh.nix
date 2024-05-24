{pkgs, ...}: {
  enable = true;
  autosuggestion.enable = true;
  enableCompletion = true;
  dotDir = ".config/zsh";
  history.ignorePatterns = ["rm *"];
  historySubstringSearch.enable = true;
  shellAliases = {
    ls = "ls --color=auto";
    la = "ls -Alh --color=auto";
    gco = "git checkout";
    gcob = "git checkout -b";
    glog = "git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'";
    gloga = "git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all";
    nr = "darwin-rebuild switch --flake ~/.dotfiles/nix-system";

    node22 = "nix shell nixpkgs/0837fbf227364d79cbae8fff2378125526905cbe#nodejs_22";
    node20 = "nix shell nixpkgs/3281bec7174f679eabf584591e75979a258d8c40#nodejs_20";
    node18 = "nix shell nixpkgs/3281bec7174f679eabf584591e75979a258d8c40#nodejs_18";
    node16 = "NIXPKGS_ALLOW_INSECURE=1 nix shell nixpkgs/a71323f68d4377d12c04a5410e214495ec598d4c#nodejs_16 --impure";
    node14 = "NIXPKGS_ALLOW_INSECURE=1 nix shell nixpkgs/9957cd48326fe8dbd52fdc50dd2502307f188b0d#nodejs_14 --impure";
    node12 = "NIXPKGS_ALLOW_INSECURE=1 nix shell nixpkgs/cce0667703fce3a1162dd252cf0864fdf83466ab#nodejs-12_x --impure";
    node10 = "NIXPKGS_ALLOW_INSECURE=1 nix shell nixpkgs/cce0667703fce3a1162dd252cf0864fdf83466ab#nodejs-10_x --impure";
  };
  syntaxHighlighting = {
    enable = true;
  };
  initExtraFirst = ''
    bindkey -v
  '';
  initExtra = ''
    function fzf-env-widget {
      env | cut -d'=' -f1 | fzf --preview "eval 'echo \$'{}"
    }
    zle -N fzf-env-widget
    bindkey "^V" fzf-env-widget

    function fzf-grep-widget {
      RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
      INITIAL_QUERY="$1"
      : | fzf --ansi --disabled --query "$INITIAL_QUERY" \
      --bind "start:reload:$RG_PREFIX {q}" \
      --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
      --delimiter : \
      --preview 'bat --color=always {1} --highlight-line {2}' \
      --preview-window '60%,+{2}+3/3,~3' \
      --bind 'enter:become(nvim {1} +{2})' \
      --height 100%
    }
    zle -N fzf-grep-widget
    bindkey '^[^F' fzf-grep-widget
  '';
}
