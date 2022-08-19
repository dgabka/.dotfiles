#!/bin/zsh

set -ex

# load antidote
source ~/.antidote/antidote.zsh

# node extras
npm i -g yarn

# rust extras
cargo install shellharden

# intall lunarvim
[ ! command -v lvim &> /dev/null ] && bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
[ -d ~/.config/lvim ] && rm -rf ~/.config/lvim
stow lvim
lvim --headless +PackerSync +q
