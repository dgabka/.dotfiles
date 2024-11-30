{
  pkgs,
  labyrinth-variant,
  ...
}: let
  labyrinth = pkgs.fetchFromGitHub {
    owner = "dgabka";
    repo = "labyrinth-k9s";
    rev = "f6154f49e66c90df3e2dcc7f42efd44f7b8b5a2b";
    sha256 = "sha256-w6SoyJnG9nIzGJx5REZwI31f7SAxDNeBW2lY5IFbcIA=";
  };
in {
  enable = true;
  settings = {
    k9s = {
      ui = {
        skin = "labyrinth";
      };
    };
  };
  skins = {
    labyrinth = "${labyrinth}/skins/labyrinth-${labyrinth-variant}.yaml";
  };
}
