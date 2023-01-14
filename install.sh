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
  "exa"
  "fnm"
  "fzf"
  "htop"
  "jq"
  "lazygit"
  "nvim"
  "pnpm"
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
sh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.sh)
git clone https://github.com/catppuccin/zsh-syntax-highlighting.git
mv zsh-syntax-highlighting ~/.local/share/


# node
fnm install --lts

# start shell
zsh configure.zsh
