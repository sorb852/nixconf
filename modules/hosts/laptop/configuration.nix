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
    specialArgs = { inherit inputs; };
    modules = [
      self.nixosModules.base
      self.nixosModules.flatpak
      self.nixosModules.gaming
      self.nixosModules.system
      self.nixosModules.Centaur
      self.nixosModules.CentaurHardware
      # {
      #   imports = [
      #     inputs.home-manager.nixosModules.home-manager
      #   ];
      #
      #   home-manager.useGlobalPkgs = true;
      #   home-manager.useUserPackages = true;
      #   home-manager.backupFileExtension = "nix.bak";
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
      self.homeModules.nixopts
      self.homeModules.cli
      # self.homeModules.ctf
      self.homeModules.flatpakGames
      self.homeModules.desktop
      self.homeModules.programming
      self.homeModules."sorb852"
    ];
  };
}
