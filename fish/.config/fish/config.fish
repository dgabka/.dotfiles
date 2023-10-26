if status is-interactive
    # Commands to run in interactive sessions can go here
end

set EDITOR hx

starship init fish | source

eval (brew shellenv)

source /usr/local/opt/asdf/libexec/asdf.fish
