# environment
set -gx fzf_fd_opts --hidden --exclude=.git
set -gx FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS'
    --color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1
    --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'

set -gx EDITOR nvim
set -gx VISUAL $EDITOR
set -gx SUDO_EDITOR $EDITOR

test -r "~/.dir_colors" && eval (dircolors ~/.dir_colors)

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

# pnpm
set -gx PNPM_HOME "/Users/dgabka/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
