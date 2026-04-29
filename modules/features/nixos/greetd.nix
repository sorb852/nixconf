{
  flake.nixosModules.greetd =
    { pkgs, ... }:
    {
      # Greeter
      services.greetd = {
        enable = true;
        settings = rec {
          initial_session = {
            command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd start-hyprland";
            user = "sorb852";
          };
          default_session = initial_session;
        };
      };

      systemd.services.greetd.serviceConfig = {
        Type = "idle";
        StandardInput = "tty";
        StandardOutput = "tty";
        StandardError = "journal";
        TTYReset = true;
        TTYVHangup = true;
        TTYVTDisallocate = true;
      };
    };
}
