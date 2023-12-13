# environment
set -gx fzf_fd_opts --hidden --exclude=.git
set -gx EDITOR hx
set -gx VISUAL $EDITOR
set -gx SUDO_EDITOR $EDITOR

starship init fish | source

# set up homebrew
if command -q brew
    fish_add_path "/opt/homebrew/bin"
    eval (brew shellenv)
end

# tabtab source for packages
# pnpm
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

# add ~/bin (e.g. rtx)
fish_add_path ~/bin
if command -q rtx 
    ~/bin/rtx activate fish | source
end

abbr glog "git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'"
abbr gloga "git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all"
