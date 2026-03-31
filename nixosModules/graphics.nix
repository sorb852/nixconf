{ config, ... }:

{
  # graphics
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true; # gotta love gui (fraud)
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
