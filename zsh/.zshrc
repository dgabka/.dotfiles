#!/bin/zsh

[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ] && source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
[ -f "$HOME/.p10k.zsh" ] && source "$HOME/.p10k.zsh"
[ -f "/usr/local/opt/asdf/libexec/asdf.sh" ] && source "/usr/local/opt/asdf/libexec/asdf.sh"

# plugins
plug "romkatv/powerlevel10k"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "hlissner/zsh-autopair"
plug "zap-zsh/supercharge"
plug "zap-zsh/vim"
plug "zap-zsh/fzf"
plug "zap-zsh/exa"

# environment
ZSH_THEME="powerlevel10k/powerlevel10k"
export EDITOR=lvim
export VISUAL=$EDITOR
export BAT_THEME="Catppuccin-macchiato"
export PATH=$PATH:~/.local/bin:~/bin:~/.cargo/bin
export PNPM_HOME="/Users/dgabka/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

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
