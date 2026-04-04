{
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nouveau" ];
  hardware.nvidia.modesetting.enable = false;
}
