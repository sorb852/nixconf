{ self, ... }:

{
  flake.homeModules.desktop =
    { pkgs, lib, ... }:
    {
      imports = [
        self.homeModules.windowManager
        self.homeModules.terminal
      ];

      home.sessionVariables = {
        EDITOR = lib.getExe pkgs.neovim;
        VISUAL = "$EDITOR";
      };

      fonts.packages = with pkgs; [
        tewi-font
        nerd-fonts.hurmit

        ankacoder-condensed
        nerd-fonts.symbols-only
      ];

      programs = {
        firefox.enable = true;
      };

      home.packages = with pkgs; [
        pavucontrol
      ];
    };
}
