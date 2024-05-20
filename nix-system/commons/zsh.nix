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
