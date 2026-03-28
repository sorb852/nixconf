{ config, pkgs, ... }: 

{
  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "Centaur";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Ulaanbaatar";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "mn_MN";
    LC_IDENTIFICATION = "mn_MN";
    LC_MEASUREMENT = "mn_MN";
    LC_MONETARY = "mn_MN";
    LC_NAME = "mn_MN";
    LC_NUMERIC = "mn_MN";
    LC_PAPER = "mn_MN";
    LC_TELEPHONE = "mn_MN";
    LC_TIME = "mn_MN";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Users
  users.users.sorb852 = {
    isNormalUser = true;
    description = "sorbileg";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  services.openssh.enable = true;
  services.pipewire.enable = false;
  services.pulseaudio.enable = true;
  hardware.bluetooth.enable = true;

  # Apparently needed for sway with home-manager
  security.polkit.enable = true;

  # idk for steam and some other stuff
  nixpkgs.config.allowUnfree = true;

  # graphics
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true; # gotta love gui (fraud)
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
