{
  inputs,
  self,
  ...
}:

let
  system = "x86_64-linux";
in
{
  flake.nixosModules.Centaur =
    { ... }:
    {
      system.stateVersion = "26.05";
    };

  flake.nixosConfigurations.Centaur = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    modules = [
      self.nixosModules.base
      self.nixosModules.gaming
      self.nixosModules.system
      self.nixosModules.Centaur
      self.nixosModules.CentaurHardware
      # NOTE: idk let's just run two commands
      # {
      #   imports = [
      #     inputs.home-manager.nixosModules.home-manager
      #   ];
      #
      #   home-manager.useGlobalPkgs = true;
      #   home-manager.useUserPackages = true;
      #
      #   home-manager.users."sorb852" = {
      #     imports = [
      #       self.homeModules."sorb852"
      #     ];
      #   };
      # }
    ];
  };

  flake.homeModules."sorb852" = {
    home.stateVersion = "26.05";
    home.username = "sorb852";
    home.homeDirectory = "/home/sorb852";
  };

  flake.homeConfigurations."sorb852" = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { inherit system; };
    modules = [
      self.homeModules.cli
      self.homeModules.ctf
      self.homeModules.sober
      self.homeModules.desktop
      self.homeModules.programming
      self.homeModules."sorb852"
    ];
  };
}
