{
  pkgs,
  labyrinth-variant,
  ...
}: let
  labyrinth-tmux =
    pkgs.tmuxPlugins.mkTmuxPlugin
    {
      pluginName = "labyrinth-tmux";
      version = "unstable-2024-01-08";
      rtpFilePath = "labyrinth.tmux";
      src = pkgs.fetchFromGitHub {
        owner = "dgabka";
        repo = "labyrinth-tmux";
        rev = "df03db394f1e25012ba15ba276a7baadce0b6627";
        sha256 = "sha256-3ok+4Tx3ZT6+So/VEZ/PKyQ8+p40HnSb1FBzNT2xJeg=";
      };
    };
in {
  enable = true;
  prefix = "C-a";
  terminal = "alacritty";
  clock24 = true;
  escapeTime = 10;
  sensibleOnTop = false;
  keyMode = "vi";
  historyLimit = 10000;

  plugins = with pkgs; [
    {
      plugin = tmuxPlugins.resurrect;
      extraConfig = "set -g @resurrect-strategy-nvim 'session'";
    }
    {
      plugin = tmuxPlugins.continuum;
      extraConfig = ''
        set -g @continuum-restore 'on'
        set -g @continuum-save-interval '10' # minutes
      '';
    }
    {
      plugin = labyrinth-tmux;
      extraConfig = ''
        if-shell 'uname | grep -q Darwin' 'set-option -g default-command "reattach-to-user-namespace -l zsh"'
        set -g @labyrinth_variant '${labyrinth-variant}'
        set -g @labyrinth_show_pane_directory 'on'
        set -g @labyrinth_window_status_separator " │ "
        set -g @labyrinth_date_time '%a %d %b, %H:%M' # It accepts the date UNIX command format (man date for info)
      '';
    }
    tmuxPlugins.yank
  ];

  extraConfig = builtins.readFile ./tmuxExtra.conf;
}
