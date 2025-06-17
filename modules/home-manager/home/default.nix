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
    pass
    gnupg
  ];
  programs.zsh.initContent = ''
    PATH=$HOME/.docker/bin:$PATH
  '';
})
