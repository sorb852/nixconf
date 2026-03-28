{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./system.nix
      ./tools.nix
      ./programming.nix
      ./applications.nix
    ];

  system.stateVersion = "25.11";
}
