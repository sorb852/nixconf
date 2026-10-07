{ self, ... }:

{
  flake.nixosModules.desktop =
    { pkgs, ... }:
    {

      imports = [
        self.nixosModules.music
        self.nixosModules.niri
        self.nixosModules.kitty
      ];

      xdg.portal = {
        enable = true;
        extraPortals = [
          pkgs.xdg-desktop-portal-gtk
          pkgs.xdg-desktop-portal-gnome
        ];
      };

      # TODO: Also style GTK and QT
      environment.sessionVariables = {
        QT_QPA_PLATFORMTHEME = "gtk3";
      };

      programs = {
        # TODO: Style
        firefox.enable = true;
      };

      environment.systemPackages = [
        pkgs.pavucontrol
        pkgs.krita
        pkgs.renoise
        pkgs.blender
        pkgs.qbittorrent
        pkgs.awww
        pkgs.brightnessctl

        pkgs.papirus-icon-theme
        pkgs.adwaita-icon-theme
        # TODO: STYLE
        pkgs.vesktop
      ];
    };
}
