{pkgs, ...}: {
  programs.fish.enable = true;
  environment.shells = [pkgs.fish];
  environment.loginShell = pkgs.fish;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  environment.systemPackages = with pkgs; [coreutils];
  fonts.fontDir.enable = true;
  fonts.fonts = [(pkgs.nerdfonts.override {fonts = ["Meslo" "JetBrainsMono"];})];
  services.nix-daemon.enable = true;
  system.defaults.NSGlobalDomain.InitialKeyRepeat = 14;
  system.defaults.NSGlobalDomain.KeyRepeat = 1;
  system.stateVersion = 4;
  users.users.dgabka.home = "/Users/dgabka";
  users.users.dgabka.shell = pkgs.fish;
}
