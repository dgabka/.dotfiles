{
  enable = true;
  enableBashIntegration = true;
  enableZshIntegration = true;
  tmux.enableShellIntegration = true;
  changeDirWidgetCommand = "fd --type d --hidden";
  changeDirWidgetOptions = [
    "--height 50%"
    "--preview 'tree -C {} | head -200'"
  ];
  defaultCommand = "fd --type f --hidden";
  defaultOptions = [
    "--height 40%"
    "--border"
  ];
  fileWidgetCommand = "fd --type f --hidden";
  fileWidgetOptions = [
    "--walker-skip .git,node_modules"
    "--preview 'bat -n --color=always {}'"
  ];
  colors = {
    "fg" = "#908caa";
    "bg" = "#191724";
    "hl" = "#ebbcba";
    "fg+" = "#e0def4";
    "bg+" = "#26233a";
    "hl+" = "#ebbcba";
    "border" = "#403d52";
    "header" = "#31748f";
    "gutter" = "#191724";
    "spinner" = "#f6c177";
    "info" = "#9ccfd8";
    "separator" = "#403d52";
    "pointer" = "#c4a7e7";
    "marker" = "#eb6f92";
    "prompt" = "#908caa";
  };
}
