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
    reattach-to-user-namespace
  ];
  programs.zsh.initExtra = ''
    PATH=$HOME/.docker/bin:$PATH
  '';
})
