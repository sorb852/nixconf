{
  flake.nixosModules.gaming =
    { pkgs, ... }:
    {
      programs = {
        gamemode.enable = true;
        gamescope.enable = true;
        steam = {
          enable = true;
          protontricks.enable = true;
          extraPackages = with pkgs; [
            curl
            cacert
            openssl
          ];
        };
      };

      environment.systemPackages = with pkgs; [
        steamtinkerlaunch
      ];
    };
}
