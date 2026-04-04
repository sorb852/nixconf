{ pkgs, ... }:

{
  home.stateVersion = "25.11";
  home.username = "sorb852";
  home.homeDirectory = "/home/sorb852";

  imports = [ ./homeModules ];
}
