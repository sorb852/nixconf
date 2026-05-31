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

      home.packages = with pkgs; [
        pavucontrol
        krita
        renoise
        blender
        qbittorrent
        awww
        brightnessctl
      ];
    };
}
