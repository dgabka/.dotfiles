#!/bin/zsh

# instant prompt
[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ] && source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

# environment
ZSH_THEME="powerlevel10k/powerlevel10k"
export CATPPUCCIN_FLAVOR="macchiato"
export EDITOR=lvim
export VISUAL=$EDITOR
export BAT_THEME="Catppuccin-$CATPPUCCIN_FLAVOR"
export PATH=$PATH:~/.local/bin:~/bin:~/.cargo/bin
export PNPM_HOME="/Users/dgabka/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"
eval $(fnm env)

# sourcing stuff
local ZAP="$HOME/.local/share/zap/zap.zsh"
[ -f "$ZAP" ] && source "$ZAP"
local P10K="$HOME/.p10k.zsh"
[ -f "$P10K" ] && source "$P10K"
local ASDF="/usr/local/opt/asdf/libexec/asdf.sh"
[ -f "$ASDF" ] && source "$ASDF"
local SYNTAX_HL="$HOME/.local/share/zsh-syntax-highlighting/themes/catppuccin_$CATPPUCCIN_FLAVOR-zsh-syntax-highlighting.zsh"
[ -f "$SYNTAX_HL" ] && source "$SYNTAX_HL"

# plugins
plug "romkatv/powerlevel10k"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "hlissner/zsh-autopair"
plug "zap-zsh/supercharge"
plug "zap-zsh/vim"
plug "zap-zsh/fzf"
plug "zap-zsh/exa"

# aliases
alias nvim="lvim"

alias gg="lazygit"
alias ga="git add"
alias gap="git add -p"
alias gc="git commit"
alias gca="git commit --amend"
alias gcan="git commit --amend --no-edit"
alias gcan!="git commit --amend --no-edit --no-verify"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gcm="git checkout master"
alias grb="git rebase"
alias grbm="git rebase master"
alias grbi="git rebase -i"
alias gps="git push"
alias gpsf="git push --force-with-lease"
alias gp="git pull"
alias gst="git status"
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'"
alias glols="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat"
alias glola="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all"

# keybinds
bindkey '^ ' autosuggest-accept
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
