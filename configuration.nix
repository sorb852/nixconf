{ config, pkgs, ... }:

{
  imports =
    [
      ./nixosModules
      ./homeModules
    ];

  system.stateVersion = "25.11";
}
