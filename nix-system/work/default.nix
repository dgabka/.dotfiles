({pkgs, ...}: {
  imports = [
    ../commons
  ];
  home.packages = with pkgs; [
    saml2aws
    awscli2
    kubectl
    kubectx
  ];
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
