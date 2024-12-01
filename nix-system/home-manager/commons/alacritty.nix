{
  pkgs,
  labyrinth-variant,
  ...
}: let
  labyrinth = pkgs.fetchFromGitHub {
    owner = "dgabka";
    repo = "labyrinth-alacritty";
    rev = "78b2e656baadde973dbb34d0c6d0c9ac234fd7f5";
    sha256 = "sha256-IRb2LF42oIcTi3lXDYzY6oJRBXBDJ6hoRLojqZHklj0=";
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
