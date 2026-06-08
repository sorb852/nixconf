{ self, ... }:

{
  flake.homeModules.desktop =
    { pkgs, lib, ... }:
    {
      imports = [
        self.homeModules.windowManager
        self.homeModules.terminal
        self.homeModules.quickshell
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

      home.packages = with pkgs; [
        pavucontrol
        krita
        renoise
        blender
        qbittorrent
        awww
        brightnessctl

        papirus-icon-theme
        adwaita-icon-theme
      ];
    };
}
