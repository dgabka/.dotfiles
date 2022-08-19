#!/bin/bash

set -e -x

# install homebrew
[ ! -x "$(command -v brew)" ] && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install dependencies
brew install tmux nvim fnm lazygit ripgrep fzf bat jq rustup stylua tree-sitter stow shellcheck zsh

# init shell
[ -f ~/.zshrc ] && rm ~/.zshrc
stow zsh
stow p10k
zsh_location="$(which zsh)"
if ! grep -q "$zsh_location" "/etc/shells"; then
  echo "$zsh_location" | sudo tee -a /etc/shells
fi
sudo chsh -s "$(which zsh)" "$USER"
[ ! -d ~/.antidote ] && git clone --depth=1 https://github.com/mattmc3/antidote.git ~/.antidote

# node
fnm install --lts

# start shell
zsh configure.zsh
