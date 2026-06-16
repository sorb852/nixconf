{ inputs, ... }:
{
  flake.nixosModules.gaming =
    { pkgs, ... }:
    {
      imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];

      nixpkgs.overlays = [ inputs.millennium.overlays.default ];

      programs = {
        gamemode = {
          enable = true;
          enableRenice = true;
        };
        # gamescope.enable = true;

        steam = {
          enable = true;
          package = pkgs.millennium-steam;
          gamescopeSession.enable = true;
          protontricks.enable = true;
        };
      };

      users.users.sorb852 = {
        extraGroups = [
          "gamemode"
        ];
      };

      environment.systemPackages = with pkgs; [
        steamtinkerlaunch
        mangohud
        protonup-ng
        osu-lazer
      ];

      # I'm sorry gng
      # I trust vimjoyer on ts one
      # Lowkey been struggling with hollow knight too much (fuckass stutters man)
      environment.sessionVariables = {
        STEAM_EXTRA_COMPAT_TOOLS_PATH = "/home/sorb852/.steam/root/compatibilitytools.d";
      };

      services.flatpak = {
        enable = true;
        packages = [
          {
            appId = "org.vinegarhq.Sober";
            origin = "flathub";
          }
          # I know I could use the official derivation but like
          # actually no i hate you now just gbecause i hate you
          {
            appId = "org.polymc.PolyMC";
            origin = "flathub";
          }
        ];
      };
    };
}
