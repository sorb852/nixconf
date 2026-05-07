{
  flake.nixosModules.gaming =
    { pkgs, ... }:
    {
      programs = {
        gamemode = {
          enable = true;
          enableRenice = true;
        };
        # gamescope.enable = true;
        steam = {
          enable = true;
          gamescopeSession.enable = true;
          protontricks.enable = true;
        };
      };

      environment.systemPackages = with pkgs; [
        steamtinkerlaunch
        mangohud
        protonup-ng
      ];

      # I'm sorry gng
      # I trust vimjoyer on ts one
      # Lowkey been struggling with hollow knight too much (fuckass stutters man)
      environment.sessionVariables = {
        STEAM_EXTRA_COMPAT_TOOLS_PATH = "/home/sorb852/.steam/root/compatibilitytools.d";
      };
    };
}
