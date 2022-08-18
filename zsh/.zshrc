# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ${HOME}/.zsh_plugins.sh

ZSH_THEME="powerlevel10k/powerlevel10k"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh
eval "$(fnm env --use-on-cd)"

export EDITOR=lvim
export VISUAL=$EDITOR
export BAT_THEME="Nord"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=6"

export PATH=$PATH:~/.local/bin:~/bin:~/.cargo/bin
