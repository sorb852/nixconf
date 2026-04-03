{
  description = "Pioneering shelxperience";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    # THATS IT, I'm going all in
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.Centaur = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "nix.bak";

            home-manager.extraSpecialArgs = { inherit inputs; };

            home-manager.users.sorb852 = import ./home.nix;

            nix.settings.experimental-features = [
              "nix-command"
              "flakes"
            ];
          }
        ];
      };
    };
}
