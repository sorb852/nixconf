{
  inputs,
  self,
  ...
}:

let
  system = "x86_64-linux";
in
{
  flake.nixosModules.Centaur = {
    system.stateVersion = "26.05";
  };

  flake.nixosConfigurations.Centaur = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs; };
    modules = [
      self.nixosModules.base
      self.nixosModules.gaming
      self.nixosModules.system
      self.nixosModules.cli
      self.nixosModules.desktop
      self.nixosModules.programming
      self.nixosModules.Centaur
      self.nixosModules.CentaurHardware
    ];
  };
}
