#!/bin/zsh

set -ex

# node extras
fnm completions --shell zsh
npm i -g yarn

# rust extras
cargo install shellharden

# intall lunarvim
[ ! command -v lvim &> /dev/null ] && bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
[ -d ~/.config/lvim ] && rm -rf ~/.config/lvim
stow lvim
lvim --headless +PackerSync +q
