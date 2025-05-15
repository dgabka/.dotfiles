{
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
    saml2aws
    awscli2
    kubectl
    kubectx
    glab
    fnm
    colima
    devbox
    reattach-to-user-namespace
    pass
    gnupg
  ];
  programs.zsh.shellAliases = {
    sports = "cd ~/williamhillplc/sports/";
  };
  programs.zsh.initExtra = ''
    useFnm() {
      eval $(fnm env);
      fnm use $1;
    }
  '';
  programs.k9s = import ./k9s.nix {
    inherit pkgs;
    inherit labyrinth-variant;
  };
}
