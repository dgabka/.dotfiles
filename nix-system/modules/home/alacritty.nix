{pkgs, ...}: {
  enable = true;
  settings = {
    # TODO fix?
   shell.program = "/etc/profiles/per-user/dgabka/bin/tmux";
   shell.args = [ "new" "-A" "-s" "main" ];
    cursor.blink_interval = 500;
    cursor.style = {
      blinking = "Always";
      shape = "Block";
    };
    font.size = 15;
    font.normal = {family = "JetBrainsMono Nerd Font";};
    font.italic = {
      family = "JetBrainsMono Nerd Font";
      style = "Italic";
    };
    font.bold = {
      family = "JetBrainsMono Nerd Font";
      style = "Bold";
    };
    font.bold_italic = {
      family = "JetBrainsMono Nerd Font";
      style = "Bold Italic";
    };
    font.offset = {
      x = 0;
      y = 1;
    };
    window = {
      decorations = "buttonless";
      dynamic_padding = true;
      option_as_alt = "OnlyLeft";
      padding = {
        x = 2;
        y = 1;
      };
    };

    colors = {
      bright = {
        black = "0x6e6a86";
        blue = "0x9ccfd8";
        cyan = "0xea9a97";
        green = "0x3e8fb0";
        magenta = "0xc4a7e7";
        red = "0xeb6f92";
        white = "0xe0def4";
        yellow = "0xf6c177";
      };
      cursor = {
        cursor = "#ea9a97";
        text = "#393552";
      };
      hints.end = {
        background = "#2a273f";
        foreground = "#6e6a86";
      };
      hints.start = {
        background = "#2a273f";
        foreground = "#908caa";
      };
      line_indicator = {
        background = "None";
        foreground = "None";
      };
      normal = {
        black = "0x393552";
        blue = "0x9ccfd8";
        cyan = "0xea9a97";
        green = "0x3e8fb0";
        magenta = "0xc4a7e7";
        red = "0xeb6f92";
        white = "0xe0def4";
        yellow = "0xf6c177";
      };
      primary = {
        background = "0x232136";
        foreground = "0xe0def4";
      };
      selection = {
        background = "0x44415a";
        text = "0xe0def4";
      };
      vi_mode_cursor = {
        cursor = "0x56526e";
        text = "0xe0def4";
      };
    };
  };
}
