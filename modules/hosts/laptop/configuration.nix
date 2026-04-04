{ inputs, self, ... }:

{
  flake.nixosModules.Centaur =
    { pkgs, ... }:
    {
    };

  flake.nixosConfiguration.Centaur = inputs.nixpkgs.lib.nixosSystem {
    imports = [
      self.nixosModules.Centaur
    ];
  };
}
