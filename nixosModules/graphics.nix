# { config, ... }:

{
  # graphics
  hardware.graphics.enable = true;
  # services.xserver.videoDrivers = [ "nvidia" ];
  services.xserver.videoDrivers = [ "nouveau" ];

  # hardware.nvidia.enabled = false;
  hardware.nvidia.modesetting.enable = false;

  # hardware.nvidia = {
  #   modesetting.enable = true;
  #   # powerManagement.enable = false;
  #   # powerManagement.finegrained = false;
  #   open = false;
  #   # nvidiaSettings = true; # gotta love gui (fraud)
  #   # package = config.boot.kernelPackages.nvidiaPackages.stable;
  # };
}
