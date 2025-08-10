({
  pkgs,
  labyrinth-variant,
  ...
}: {
  imports = [
    ../commons
  ];
  home.packages = with pkgs; [
    rename
  ];

  programs.git.userName = "dgabka";
  programs.git.userEmail = "gabka.daw@gmail.com";
})
