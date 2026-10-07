{ self, ... }:

{
  flake.nixosModules.base = {
    imports = [
      self.nixosModules.essentials
      self.nixosModules.nixopts
    ];
  };
}
