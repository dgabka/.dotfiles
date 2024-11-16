{
  pkgs,
  labyrinth-variant,
  ...
}: let
  theme = pkgs.fetchFromGitHub {
    owner = "dgabka";
    repo = "labyrinth-fzf";
    rev = "9fe783b027f8c35c04b686ff4cb1a9777e5df73d";
    sha256 = "sha256-/HJ8XEHoqxfOHmqmCkIuU7KCBqlzsj7reTjo3Fo7UGk=";
  };
in {
  enable = true;
  enableBashIntegration = true;
  enableZshIntegration = true;
  changeDirWidgetCommand = "fd --type d --hidden";
  changeDirWidgetOptions = [
    "--height 50%"
    "--preview 'tree -C {} | head -200'"
    "--border=none"
    "--preview-window 'border-none'"
    "--no-separator"
    "--no-scrollbar"
  ];
  defaultCommand = "fd --type f --hidden";
  defaultOptions = [
    "--height 50%"
    "--border=none"
    "--preview-window 'border-none'"
    "--no-separator"
    "--no-scrollbar"
  ];
  fileWidgetCommand = "fd --type f --hidden";
  fileWidgetOptions = [
    "--walker-skip .git,node_modules"
    "--preview 'bat -n --color=always {}'"
    "--preview-window 'border-none'"
    "--border=none"
    "--no-separator"
    "--no-scrollbar"
  ];
  tmux.enableShellIntegration = true;
  colors = import "${theme}/dist/labyrinth-${labyrinth-variant}.nix";
}
