{pkgs, ...}: {
  imports = [
    ../commons
  ];

  # optional, recommended
  xdg.enable = true;
  home.packages = with pkgs; [
    rename
    reattach-to-user-namespace
    pass
    gnupg
  ];
  programs.zsh.initContent = ''
    PATH=$HOME/.docker/bin:$PATH
  '';
}
