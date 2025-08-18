{
  pkgs,
  labyrinth-variant,
  config,
  ...
}: {
  imports = [
    ../commons
    ./k9s.nix
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
  programs.zsh.initContent = ''
    useFnm() {
      eval $(fnm env);
      fnm use $1;
    }

    SSL_CERT_FILE=${config.home.homeDirectory}/CertificateChain.pem
  '';
}
