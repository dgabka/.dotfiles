#!/bin/zsh

set -x

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

# init tmux
stow tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf

# init bat
stow bat
bat cache --build
