# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# You can change the names/locations of these if you prefer.
antidote_dir=~/.antidote
plugins_txt=~/.zsh_plugins.txt
static_file=~/.zsh_plugins.zsh

# Clone antidote if necessary and generate a static plugin file.
if [[ ! $static_file -nt $plugins_txt ]]; then
  [[ -e $antidote_dir ]] ||
    git clone --depth=1 https://github.com/mattmc3/antidote.git $antidote_dir
  (
    source $antidote_dir/antidote.zsh
    [[ -e $plugins_txt ]] || touch $plugins_txt
    antidote bundle <$plugins_txt >$static_file
  )
fi

# source the static plugins file
source $static_file

# cleanup
unset antidote_dir plugins_file static_file

# theme
ZSH_THEME="powerlevel10k/powerlevel10k"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh

eval "$(fnm env --use-on-cd)"

export EDITOR=lvim
export VISUAL=$EDITOR
export BAT_THEME="Nord"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=6"

export PATH=$PATH:~/.local/bin:~/bin:~/.cargo/bin

# keybindings
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
