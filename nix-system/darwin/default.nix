{pkgs, ...}: {
  programs.zsh.enable = true;
  environment.shells = [pkgs.zsh];
  environment.loginShell = pkgs.zsh;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  environment.systemPackages = with pkgs; [coreutils];
  fonts.packages = [./fonts];
  services.nix-daemon.enable = true;
  system.defaults.NSGlobalDomain.InitialKeyRepeat = 14;
  system.defaults.NSGlobalDomain.KeyRepeat = 1;
  system.stateVersion = 4;
  users.users.dgabka.home = "/Users/dgabka";
  users.users.dgabka.shell = pkgs.zsh;
}
