{ inputs, ... }:

{
  flake.nixosModules.gaming = {
    imports = [
      inputs.nix-flatpak.homeManagerModules.nix-flatpak
    ];

    programs.steam.enable = true;

    services.flatpak = {
      enable = true;
      packages = [
        {
          appId = "org.vinegarhq.Sober";
          origin = "flathub";
        }
      ];
    };
  };
}
