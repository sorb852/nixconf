{ inputs, ... }:

{

  # imports = [ inputs.nixvim.homeModules.nixvim ];
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];
  # services.flatpak = {
  #   enable = true;
  #   packages = [
  #     {
  #       appid = "org.vinegarhq.Sober";
  #       origin = "flathub";
  #     }
  #   ];
  # };
}
