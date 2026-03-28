{
  description = "MY NixOS dots";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations.Centaur = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          # js move the old files
          home-manager.backupFileExtension = "nix.bak";

          home-manager.users.sorb852 = import ./home.nix;

          nix.settings.experimental-features = [ "nix-command" "flakes" ];
        }
      ];
    };
  };
}

