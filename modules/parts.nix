{ inputs, ... }:
{
  systems = [
    "x86_64-linux"
    # Hopefully these work
    # Well not my problem now is it
    "aarch64-linux"
    "x86_64-darwin"
    "aarch64-darwin"
  ];

  imports = [
    inputs.home-manager.flakeModules.home-manager
    inputs.devenv.flakeModule
  ];
}
