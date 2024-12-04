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
        rev = "908ee5c058edd4eb8d3593843c66c4b1e051187b";
        sha256 = "sha256-BrTY2PR4g5nkicIASoScdxMm+2hOqvN9DB6+Rj7fd6k=";
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
        set-option -g default-command "reattach-to-user-namespace -l zsh"
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
