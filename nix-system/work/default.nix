({pkgs, ...}: {
  imports = [
    ../commons
  ];
  home.packages = with pkgs; [
    saml2aws
    awscli2
    kubectl
    kubectx
    glab
    fnm
    colima
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
  programs.k9s = {
    enable = true;
    settings = {
      k9s = {
        ui = {
          skin = "rose-pine-moon";
        };
      };
    };
    skins = {
      rose-pine-moon = import ./k9s_rose_pine_moon.nix;
    };
  };
})
