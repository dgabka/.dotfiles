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
  sensible =
    pkgs.tmuxPlugins.mkTmuxPlugin
    {
      pluginName = "sensible";
      version = "unstable-2024-01-08";
      src = pkgs.fetchFromGitHub {
        owner = "tmux-plugins";
        repo = "tmux-sensible";
        rev = "25cb91f42d020f675bb0a2ce3fbd3a5d96119efa";
        sha256 = "sha256-sw9g1Yzmv2fdZFLJSGhx1tatQ+TtjDYNZI5uny0+5Hg=";
      };
      postInstall = ''
        sed -e 's:reattach-to-user-namespace:${pkgs.reattach-to-user-namespace}/bin/reattach-to-user-namespace:g' -i $target/sensible.tmux
      '';
    };
in {
  enable = true;
  prefix = "C-a";
  terminal = "alacritty";
  clock24 = true;
  escapeTime = 10;
  newSession = true;
  sensibleOnTop = false;
  keyMode = "vi";

  plugins = with pkgs; [
    {
      plugin = sensible;
    }
    {
      plugin = tmuxPlugins.resurrect;
      extraConfig = "set -g @resurrect-strategy-nvim 'session'";
    }
    {
      plugin = tmuxPlugins.continuum;
      extraConfig = ''
        set -g @continuum-restore 'on'
        set -g @continuum-save-interval '60' # minutes
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

  extraConfig = ''
    set -ag terminal-overrides ",alacritty:RGB"
    set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
    set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colours - needs tmux-3.0

    # Allows to use C-a a <command> to send commands to a TMUX session inside
    # another TMUX session
    bind-key a send-prefix

    # split panes using | and -
    bind | split-window -h -c "#{pane_current_path}"
    bind - split-window -v -c "#{pane_current_path}"
    unbind '"'
    unbind %

    # start selection with v
    bind -T copy-mode-vi v send -X begin-selection

    # Easy pane resize
    bind -n S-M-Left resize-pane -L 5
    bind -n S-M-Right resize-pane -R 5
    bind -n S-M-Up resize-pane -U 3
    bind -n S-M-Down resize-pane -D 3

    # Shift arrow to switch windows
    bind -n S-Left  previous-window
    bind -n S-Right next-window

    # Smart pane switching with awareness of Vim splits.
    # See: https://github.com/christoomey/vim-tmux-navigator

    # decide whether we're in a Vim process
    is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
        | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"

    bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h' 'select-pane -L'
    bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j' 'select-pane -D'
    bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k' 'select-pane -U'
    bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l' 'select-pane -R'

    bind-key -T copy-mode-vi 'C-h' select-pane -L
    bind-key -T copy-mode-vi 'C-j' select-pane -D
    bind-key -T copy-mode-vi 'C-k' select-pane -U
    bind-key -T copy-mode-vi 'C-l' select-pane -R
  '';
}
