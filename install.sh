#!/bin/bash

set -x

# install homebrew
if [ ! -x "$(command -v brew)" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  brew update
  brew upgrade
fi

brew_packages=(
  "bat"
  "fnm"
  "fzf"
  "htop"
  "jq"
  "lazygit"
  "nvim"
  "ripgrep"
  "rustup"
  "shellcheck"
  "stow"
  "stylua"
  "tmux"
  "tree-sitter"
  "zsh"
)

# install dependencies
brew install "${brew_packages[*]}"

# init shell
[ -f ~/.zshrc ] && rm ~/.zshrc
[ -f ~/.p10k.zsh ] && rm ~/.p10k.zsh
stow zsh p10k
zsh_location="$(which zsh)"
if ! grep -q "$zsh_location" "/etc/shells"; then
  echo "$zsh_location" | sudo tee -a /etc/shells
fi
sudo chsh -s "$zsh_location" "$USER"
[ ! -d ~/.antidote ] && git clone --depth=1 https://github.com/mattmc3/antidote.git ~/.antidote

# node
fnm install --lts

# start shell
zsh configure.zsh
