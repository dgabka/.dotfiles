{
  pkgs,
  labyrinth-variant,
  ...
}: let
  labyrinth = pkgs.fetchFromGitHub {
    owner = "dgabka";
    repo = "labyrinth-k9s";
    rev = "5a4a23ae06467009ff9eb3ded34346d820709d1c";
    sha256 = "sha256-K12hmXkml43eIOswo6GDrL3t52YGmt4RjBlE187M5rI=";
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
