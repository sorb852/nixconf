{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kitty
    pavucontrol
  ];

  programs = {
    sway.enable = true;
    firefox.enable = true;
    steam.enable = true;
  };

  system.stateVersion = "25.11";
}
