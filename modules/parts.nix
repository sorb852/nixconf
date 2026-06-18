{ inputs, ... }:
{
  imports = [
    inputs.devenv.flakeModule
    inputs.wrappers.flakeModules.wrappers
  ];

  options = {
    flake = inputs.flake-parts.lib.mkSubmoduleOptions {
      wrappersModules = inputs.nixpkgs.lib.mkOption {
        default = { };
      };
    };
  };

  config = {
    systems = [
      "x86_64-linux"
      # Hopefully these work
      # Well not my problem now is it
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];
  };
}
