{
  darwin,
  home-manager,
  pkgs,
  system,
  userConfig,
  extraModules,
  labyrinth-variant,
  ...
}:
darwin.lib.darwinSystem {
  inherit system pkgs;
  modules =
    [
      ../../modules/darwin
      home-manager.darwinModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.dgabka = userConfig;
          extraSpecialArgs = {inherit labyrinth-variant;};
        };
      }
    ]
    ++ extraModules;
}
