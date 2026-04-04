{
  flake.nixosModules.greetd =
    { pkgs, ... }:
    {
      # Greeter
      services.greetd = {
        enable = true;
        settings = rec {
          initial_session = {
            command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd sway";
            user = "sorb852";
          };
          default_session = initial_session;
        };
      };

      systemd.services.greetd.serviceConfig = {
        Type = "idle";
        StandardInput = "tty";
        StandardOutput = "tty";
        StandardError = "journal"; # Better for debugging
        TTYReset = true;
        TTYVHangup = true;
        TTYVTDisallocate = true;
      };
    };
}
