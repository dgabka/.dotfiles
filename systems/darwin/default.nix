# # Common configuration for all Darwin (macOS) systems
# {
#   darwin,
#   home-manager,
#   pkgs,
#   system,
#   userConfig,
#   extraModules,
#   ...
# }:
# darwin.lib.darwinSystem {
#   inherit system;
#   inherit pkgs;
#   modules =
#     [
#       ../../modules/darwin
#       home-manager.darwinModules.home-manager
#       {
#         home-manager = {
#           useGlobalPkgs = true;
#           useUserPackages = true;
#           users.dgabka = userConfig;
#         };
#       }
#     ]
#     ++ extraModules;
# }
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
