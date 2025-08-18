ZSH_AUTOSUGGEST_STRATEGY=(history completion)

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^E" edit-command-line

bindkey '^ ' autosuggest-accept

function fzf-grep-widget {
  RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
  INITIAL_QUERY="$1"
  : | fzf -d 100% -- --ansi --disabled --query "$INITIAL_QUERY" \
    --bind "start:reload:$RG_PREFIX {q}" \
    --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
    --delimiter : \
    --preview 'bat --color=always {1} --highlight-line {2}' \
    --preview-window '60%,+{2}+3/3,~3' \
    --bind 'enter:become(nvim {1} +{2})' \
    --height 100%
}
zle -N fzf-grep-widget
# CTRL+ALT+F
bindkey '^[^F' fzf-grep-widget

PATH=$HOME/.npm/bin:$PATH

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=blue"
