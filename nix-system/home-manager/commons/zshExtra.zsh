autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd "^[e" edit-command-line
bindkey -M viins "^[e" edit-command-line

function fzf-env-widget {
  env | cut -d'=' -f1 | fzf --preview "eval 'echo \$'{}"
}
zle -N fzf-env-widget
# CTRL+ALT+V
bindkey "^[^V" fzf-env-widget

function fzf-grep-widget {
  RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
  INITIAL_QUERY="$1"
  : | fzf-tmux -d 100% -- --ansi --disabled --query "$INITIAL_QUERY" \
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

function sesh {
  if [[ $# -eq 1 ]]; then
    selected=$1
  else
    selected=$(fd -t d -I --glob -E node_modules --format {//} .git ~/repos ~/.dotfiles ~/williamhillplc 2>/dev/null | fzf-tmux -p)
  fi

  if [[ -z $selected ]]; then
    exit 0
  fi

  selected_name=$(basename "$selected" | tr . _)
  tmux_running=$(pgrep tmux)

  if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
  fi

  if ! tmux has-session -t=$selected_name 2>/dev/null; then
    tmux new-session -ds $selected_name -c $selected
  fi

  tmux switch-client -t $selected_name
}
zle -N sesh
# CTRL+ALT+X
bindkey '^[^X' sesh

PATH=$HOME/.npm/bin:$PATH
