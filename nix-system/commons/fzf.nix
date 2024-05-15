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
    "bg" = "#232136";
    "hl" = "#ea9a97";
    "fg+" = "#e0def4";
    "bg+" = "#393552";
    "hl+" = "#ea9a97";
    "border" = "#44415a";
    "header" = "#3e8fb0";
    "gutter" = "#232136";
    "spinner" = "#f6c177";
    "info" = "#9ccfd8";
    "separator" = "#44415a";
    "pointer" = "#c4a7e7";
    "marker" = "#eb6f92";
    "prompt" = "#908caa";
  };
}
