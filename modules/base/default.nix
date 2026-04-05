{ self, ... }:

{
  flake.nixosModules.base = {
    imports = [
      self.nixosModules.users
      self.nixosModules.essentials
      self.nixosModules.nixopts
      self.nixosModules.theme
    ];
  };
}
