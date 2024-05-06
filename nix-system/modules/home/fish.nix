{pkgs, ...}: {
  enable = true;
  plugins = [
    {
      name = "fzf";
      src = pkgs.fetchFromGitHub {
        owner = "patrickf1";
        repo = "fzf.fish";
        rev = "8920367cf85eee5218cc25a11e209d46e2591e7a";
        sha256 = "1hqqppna8iwjnm8135qdjbd093583qd2kbq8pj507zpb1wn9ihjg";
      };
    }
    {
      name = "rose-pine";
      src = pkgs.fetchFromGitHub {
        owner = "rose-pine";
        repo = "fish";
        rev = "38aab5baabefea1bc7e560ba3fbdb53cb91a6186";
        sha256 = "0bwsq9pz1nlhbr3kyz677prgyk973sgis72xamm1737zqa98c8bd";
      };
    }
    {
      name = "nix-env";
      src = pkgs.fetchFromGitHub {
        owner = "lilyball";
        repo = "nix-env.fish";
        rev = "7b65bd228429e852c8fdfa07601159130a818cfa";
        sha256 = "069ybzdj29s320wzdyxqjhmpm9ir5815yx6n522adav0z2nz8vs4";
      };
    }
  ];
  shellAbbrs = {
    gco = "git checkout";
    gcob = "git checkout -b";
    glog = "git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'";
    gloga = "git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all";
  };
  interactiveShellInit = ''
    fish_config theme choose "Rosé Pine Moon"
  '';
}
