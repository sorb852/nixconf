{ self, ... }:

{
  flake.homeModules.desktop =
    { pkgs, lib, ... }:
    {
      imports = [
        self.homeModules.terminal
        self.homeModules.music
      ];

      programs = {
        firefox.enable = true;
        vesktop.enable = true; # holy shit i can feel the beard growing out of my chin
      };

      home.sessionVariables = {
        QT_QPA_PLATFORMTHEME = "gtk3";
      };

      gtk = {
        enable = true;
        iconTheme = {
          name = "Papirus-Dark";
          package = pkgs.papirus-icon-theme;
        };
      };

      home.packages = [
        pkgs.pavucontrol
        pkgs.krita
        pkgs.renoise
        pkgs.blender
        pkgs.qbittorrent
        pkgs.awww
        pkgs.brightnessctl

        pkgs.papirus-icon-theme
        pkgs.adwaita-icon-theme

        self.packages.${pkgs.system}.niri
      ];
    };
}
