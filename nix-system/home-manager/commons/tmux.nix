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
        rev = "0bcab8a07abdf8d5c56898f0b5c21d741e137ffd";
        sha256 = "sha256-bvC42ctPyo2o2h5Muh7aHwHhDYb3MOlDEdrVqt+dH74=";
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
