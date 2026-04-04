{ inputs, self, ... }:

{
  flake.nixosModules.Centaur =
    { pkgs, ... }:
    {
      # yeah good luck getting shit here lol
    };

  flake.nixosConfigurations.Centaur = inputs.nixpkgs.lib.nixosSystem {
    # system = "x86-64_linux";
    modules = [
      self.nixosModules.base
      self.nixosModules.gaming
      self.nixosModules.system
      self.nixosModules.Centaur
      self.nixosModules.CentaurHardware
    ];
  };

  flake.homeConfigurations."sorb852" = inputs.home-manager.lib.homeManagerConfiguration {
    modules = [
      self.homeModules.cli
      self.homeModules.ctf
      self.homeModules.sober
      self.homeModules.desktop
      self.homeModules.programming
    ];
  };
}
