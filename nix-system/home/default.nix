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
    pre-commit
    rename
  ];
})
