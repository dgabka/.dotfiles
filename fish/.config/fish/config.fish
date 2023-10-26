if status is-interactive
    # Commands to run in interactive sessions can go here
end

set EDITOR hx

starship init fish | source

eval (brew shellenv)

source /usr/local/opt/asdf/libexec/asdf.fish

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

# pnpm
set -gx PNPM_HOME "/Users/dgabka/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end