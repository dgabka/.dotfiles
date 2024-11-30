{
  pkgs,
  labyrinth-variant,
  ...
}: let
  labyrinth = pkgs.fetchFromGitHub {
    owner = "dgabka";
    repo = "labyrinth-alacritty";
    rev = "9659500fbd33c9c6d33cca0ecaa0b5cdd4fcdcb3";
    sha256 = "sha256-fV0u+LavycEpmcq/Fy3Tw8q3jZMQpyNyS8tr3+a1ebE=";
  };
in {
  enable = true;
  settings = {
    cursor.blink_interval = 500;
    cursor.blink_timeout = 0;
    cursor.style = {
      blinking = "Always";
      shape = "Block";
    };
    font.size = 17;
    font.normal = {
      family = "OperatorMono Nerd Font";
      style = "Light";
    };
    font.italic = {
      family = "OperatorMono Nerd Font";
      style = "Light Italic";
    };
    font.bold = {
      family = "OperatorMono Nerd Font";
      style = "Regular";
    };
    font.bold_italic = {
      family = "OperatorMono Nerd Font";
      style = "Italic";
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

    general.import = [
      "${labyrinth}/dist/labyrinth-${labyrinth-variant}.toml"
    ];
  };
}
