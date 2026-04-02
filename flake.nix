{
  description = "Pioneering shelxperience";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    rolling-pkgs.url = "github:nixos/nixpkgs/f2e835f48b16c6a26d3b9249362e93867b262f9d"; # Used for some nvim plugins

    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim/nixos-25.11";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    # Gonna try ags for a while
    # I mean I'm gonna switch to quickshell
    # But you know
    # Seems a bit too annoying to config rn, commiting later

    # astal = {
    #   url = "github:aylur/astal";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    #
    # ags = {
    #   url = "github:aylur/ags";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.astal.follows = "astal";
    # };
  };

  outputs =
    inputs@{
      nixpkgs,
      rolling-pkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      rolling = rolling-pkgs.legacyPackages.${system};
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

            home-manager.extraSpecialArgs = { inherit inputs rolling; };

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
