# Basically a nix file for those using nixos and nixos only.
# So WSL and Mac users or even other linux distro hosts not toucing this.
{ self, ... }:

{
  flake.nixosModules.system =
    { ... }:
    {
      # Other system related modules
      imports = [
        self.nixosModules.locale
        self.nixosModules.greetd
      ];

      # Audio
      services.pipewire.enable = false;
      services.pulseaudio.enable = true;

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
    };
}
