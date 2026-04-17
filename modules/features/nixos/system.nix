# Basically a nix file for those using nixos and nixos only.
# So WSL and Mac users or even other linux distro hosts not toucing this.
{ self, ... }:

{
  flake.nixosModules.system =
    { pkgs, ... }:
    {
      # Other system related modules
      imports = [
        self.nixosModules.locale
        self.nixosModules.greetd
      ];

      # Audio
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        wireplumber.extraConfig."10-disable-amplification" = {
          "monitor.alsa.rules" = [
            {
              matches = [ { "node.name" = "~alsa_output.*"; } ];
              actions = {
                update-props = {
                  # This prevents the volume from ever going above 1.0 (100%)
                  "node.soft-volume" = true;
                  "volume.max" = 1.0;
                };
              };
            }
          ];
        };
        # extraConfig.pipewire = {
        #   "stream.properties" = {
        #     "channelmix.min-volume" = 0.0;
        #     "channelmix.max-volume" = 1.0;
        #   };
        # };
      };
      environment.systemPackages = with pkgs; [
        # pulseaudio
        wireplumber
      ];

      # Bluetooth
      hardware.bluetooth.enable = true;

      # Bootloader
      boot.loader.systemd-boot.enable = true;

      # Sysrq for crash handling
      boot.kernel.sysctl."kernel.sysrq" = 502;

      # Networking
      networking.hostName = "Centaur";
      networking.networkmanager.enable = true;

      # SSH
      services.openssh.enable = true;

      # Apparently needed for sway with home-manager
      security.polkit.enable = true;

      # XDG portal
      xdg.portal = {
        enable = true;
        wlr.enable = true;
        config.common.default = [ "gtk" ];
      };

      # Fonts
      fonts.packages = with pkgs; [
        # nerd-fonts.hurmit

        ankacoder-condensed
        nerd-fonts.symbols-only
      ];
    };
}
