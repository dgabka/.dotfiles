({
  pkgs,
  labyrinth-variant,
  ...
}: {
  imports = [
    (import ../commons {
      inherit pkgs;
      inherit labyrinth-variant;
    })
  ];
  home.packages = with pkgs; [
    rename
  ];

  programs.git.userName = "dgabka";
  programs.git.userEmail = "gabka.daw@gmail.com";
})
