{ self, ... }:

{
  flake.nixosModules.base = {
    imports = [
      self.nixosModules.user
      self.nixosModules.essentials
      self.nixosModules.nixopts
    ];
  };
}
