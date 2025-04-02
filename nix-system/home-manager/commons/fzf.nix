{
  pkgs,
  labyrinth-variant,
  ...
}: let
  theme = pkgs.fetchFromGitHub {
    owner = "dgabka";
    repo = "labyrinth-fzf";
    rev = "10b21ef846ccd73425be66641840006a01eea66f";
    sha256 = "sha256-NqOikPg7Nt829ahAuZZ1cUlSmC+qk4+kh3x8dZnvqKg=";
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
