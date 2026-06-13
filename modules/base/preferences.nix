{
  # TODO: Make this a nixosModule later on (yes dithcihng homeManager is the plan)
  flake.homeModules.preferences =
    { lib, ... }:
    {
      options = {
        useDisplay = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "States if a display is used. Mainly used for noctalia color templates";
        };
      };
    };
}
