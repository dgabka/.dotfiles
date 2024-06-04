{pkgs, ...}: let
  labyrinth = pkgs.fetchFromGitHub {
    owner = "dgabka";
    repo = "labyrinth-alacritty";
    rev = "f6154f49e66c90df3e2dcc7f42efd44f7b8b5a2b";
    sha256 = "sha256-w6SoyJnG9nIzGJx5REZwI31f7SAxDNeBW2lY5IFbcIA=";
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

    import = [
      "${labyrinth}/dist/labyrinth-mist.toml"
    ];
  };
}
