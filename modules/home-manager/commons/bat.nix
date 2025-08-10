{
  pkgs,
  labyrinth-variant,
  ...
}: {
  programs.bat = {
    enable = true;
    config = {
      theme = "labyrinth";
    };
    themes = {
      labyrinth = {
        src = pkgs.fetchFromGitHub {
          owner = "dgabka";
          repo = "labyrinth-tm-theme";
          rev = "16b73b3327c37e9fbeea07ea6e1d7f9f0ce3209c";
          sha256 = "sha256-hoEJQn9hl8ktd05aJxvuXJdadU5TEv5PO8Xny+3QRxk=";
        };
        file = "dist/labyrinth-${labyrinth-variant}.tmTheme";
      };
    };
  };
}
