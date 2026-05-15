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
      security.pam.loginLimits = [
        {
          domain = "@audio";
          item = "rtprio";
          type = "-";
          value = "95";
        }
        {
          domain = "@audio";
          item = "memlock";
          type = "-";
          value = "unlimited";
        }
      ];
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        jack.enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
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

      # Power management
      services.upower.enable = true;

      # as you notice i got a little pissed off
      #
      # i swear if that damn mammal touches my pc again
      # genuinely why does he have to do that
      # whats with toddlers ragebaiting
      # cant even ethically ragebait too
      # genuine bum behaviour
      services.logind.settings.Login.HandlePowerKey = "ignore";

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
