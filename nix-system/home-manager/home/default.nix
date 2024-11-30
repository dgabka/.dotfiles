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

    # swift tools (swiftformat installed via brew)
    sourcekit-lsp
    swiftlint

    # xcode tools
    ruby
    rubyPackages.xcodeproj
  ];
  programs.zsh.initExtra = ''
    PATH=$HOME/.docker/bin:$PATH
  '';
})
