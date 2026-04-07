{ inputs, ... }:

{
  flake.homeModules.flatpakGames = {
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
        # I know I could use the official derivation but like
        # actually no i hate you now just gbecause i hate you
        {
          appId = "org.polymc.PolyMC";
          origin = "flathub";
        }
      ];
    };
  };
}
