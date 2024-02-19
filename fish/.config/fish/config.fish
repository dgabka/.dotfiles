fish_config theme choose "Rosé Pine Moon"

starship init fish | source

# environment
set -gx fzf_fd_opts --hidden --exclude=.git --color=never
set -Ux FZF_DEFAULT_OPTS "
	--color=fg:#908caa,bg:#232136,hl:#ea9a97
	--color=fg+:#e0def4,bg+:#393552,hl+:#ea9a97
	--color=border:#44415a,header:#3e8fb0,gutter:#232136
	--color=spinner:#f6c177,info:#9ccfd8,separator:#44415a
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"

set -gx EDITOR nvim
set -gx VISUAL $EDITOR
set -gx SUDO_EDITOR $EDITOR
set -gx PNPM_HOME $HOME/Library/pnpm

fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin
fish_add_path $PNPM_HOME
fish_add_path ~/.cabal/bin
fish_add_path ~/.ghcup/bin

alias glog="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'"
alias gloga="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all"

if test -f ~/.local/bin/mise
    ~/.local/bin/mise activate fish | source
end
