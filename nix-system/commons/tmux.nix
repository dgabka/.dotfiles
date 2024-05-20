{pkgs, ...}: {
  enable = true;
  prefix = "C-a";
  terminal = "alacritty";
  clock24 = true;
  escapeTime = 10;
  newSession = true;
  sensibleOnTop = true;

  plugins = with pkgs; [
    tmuxPlugins.sensible
    {
      plugin = tmuxPlugins.tmux-fzf;
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
      plugin = tmuxPlugins.rose-pine;
      extraConfig = ''
        set -g @rose_pine_host 'off' # Enables hostname in the status bar
        set -g @rose_pine_date_time '%a %d %b, %H:%M' # It accepts the date UNIX command format (man date for info)
        set -g @rose_pine_user 'on' # Turn on the username component in the statusbar
        set -g @rose_pine_directory 'off' # Turn on the current folder component in the status bar
        set -g @rose_pine_bar_bg_disabled_color_option 'default'
        set -g @rose_pine_variant 'main'
        set -g @rose_pine_disable_active_window_menu 'off'
        set -g @rose_pine_show_pane_directory 'on'
        set -g @rose_pine_show_current_program 'off'
        set -g @rose_pine_window_status_separator " │ "
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
