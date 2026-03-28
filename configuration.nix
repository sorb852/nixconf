{ config, pkgs, ... }:

{
  imports =
    [
      ./nixosModules
    ];

  system.stateVersion = "25.11";
}
