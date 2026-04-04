{
  inputs,
  self,
  ...
}:

{
  flake.nixosModules.Centaur =
    { ... }:
    {
      system.stateVersion = "26.05";
    };

  flake.nixosConfigurations.Centaur = inputs.nixpkgs.lib.nixosSystem {
    # system = "x86-64_linux";
    modules = [
      self.nixosModules.base
      self.nixosModules.gaming
      self.nixosModules.system
      self.nixosModules.Centaur
      self.nixosModules.CentaurHardware
      # self.homeConfigurations."sorb852"
      {
        imports = [
          inputs.home-manager.nixosModules.home-manager
        ];

        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;

        home-manager.users."sorb852" = {
          imports = [
            self.homeModules.cli
            self.homeModules.ctf
            self.homeModules.sober
            self.homeModules.desktop
            self.homeModules.programming
            self.homeModules."sorb852"
          ];
        };
      }
    ];
  };

  flake.homeModules."sorb852" = {
    home.stateVersion = "26.05";
    home.username = "sorb852";
    home.homeDirectory = "/home/sorb852";
  };

  # FIX: If you want to, fix this I don't think I need it now
  # flake.homeConfigurations."sorb852" = inputs.home-manager.lib.homeManagerConfiguration {
  #   modules = [
  #     self.homeModules.cli
  #     self.homeModules.ctf
  #     self.homeModules.sober
  #     self.homeModules.desktop
  #     self.homeModules.programming
  #     self.homeModules."sorb852"
  #   ];
  # };
}
