{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kitty
  ];

  programs = {
    sway.enable = true;
    firefox.enable = true;
  };

  system.stateVersion = "25.11";
}
