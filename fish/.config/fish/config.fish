if status is-interactive
    # Commands to run in interactive sessions can go here
end

set EDITOR hx

starship init fish | source

# set up homebrew
set -gx PATH "/opt/homebrew/bin" $PATH
eval (brew shellenv)

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

# pnpm
set -gx PNPM_HOME "/Users/dgabka/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# add ~/bin (e.g. rtx)
set -gx PATH ~/bin $PATH
~/bin/rtx activate fish | source
