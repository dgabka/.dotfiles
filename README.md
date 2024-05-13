# .dotfiles

Configuration files for tools I use.

All configs (except for neovim) migrated to nix.

## Setup for MacOS

1. Install nix
```
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

2. Install nix-darwin

Note: Make sure darwin configuration for the system is available.

```
nix run nix-darwin -- switch --flake ~/.dotfiles/nix-system
```

3. Change shell manually
```
echo "/etc/profiles/per-user/$(whoami)/bin/zsh" | sudo tee -a /etc/shells
chsh -s "/etc/profiles/per-user/$(whoami)/bin/zsh"
```
