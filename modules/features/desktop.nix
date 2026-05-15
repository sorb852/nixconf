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

      # home.sessionVariables = {
      #   EDITOR = lib.getExe pkgs.neovim;
      #   VISUAL = "$EDITOR";
      # };

      programs = {
        firefox.enable = true;
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
