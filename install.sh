#!/bin/bash

set -e -x

# install homebrew
[ ! -x "$(command -v brew)" ] && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install dependencies
brew install tmux nvim fnm lazygit ripgrep fzf bat jq rustup stylua tree-sitter antibody stow shellcheck

# init shell
[ -f ~/.zshrc ] && rm ~/.zshrc
stow zsh
stow p10k
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s "$(which zsh)" "$USER"
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# node
fnm install --lts

# start shell
zsh configure.zsh
