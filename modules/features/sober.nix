{ inputs, ... }:

{
  flake.homeManager.sober = {
    imports = [
      inputs.nix-flatpak.homeManagerModules.nix-flatpak
    ];

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
