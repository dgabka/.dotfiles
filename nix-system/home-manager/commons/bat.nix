{
  pkgs,
  labyrinth-variant,
  ...
}: {
  enable = true;
  config = {
    theme = "labyrinth";
  };
  themes = {
    labyrinth = {
      src = pkgs.fetchFromGitHub {
        owner = "dgabka";
        repo = "labyrinth-tm-theme";
        rev = "e88cf8d61640cf564a519f3fb8c86d19c1a84b57";
        sha256 = "sha256-4R4zr3XiT5ER/JtRhjtX7CpHiGfie4FbaJraXjFrcsI=";
      };
      file = "dist/labyrinth-${labyrinth-variant}.tmTheme";
    };
  };
}
