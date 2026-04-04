{
  flake.nixosModules.Centaur =
    {
      config,
      lib,
      modulesPath,
      ...
    }:
    {
      hardware.graphics.enable = true;
      services.xserver.videoDrivers = [ "nouveau" ];
      hardware.nvidia.modesetting.enable = false;

      # === ORIGINAL HARDWARECONFIG.nix
      imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
      ];

      boot.initrd.availableKernelModules = [
        "xhci_pci"
        "ahci"
        "usb_storage"
        "sd_mod"
      ];
      boot.initrd.kernelModules = [ ];
      boot.kernelModules = [ "kvm-intel" ];
      boot.extraModulePackages = [ ];

      fileSystems."/" = {
        device = "/dev/disk/by-uuid/73611510-9f67-4270-a936-f193fc328682";
        fsType = "ext4";
      };

      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/6B83-6515";
        fsType = "vfat";
        options = [
          "fmask=0077"
          "dmask=0077"
        ];
      };

      swapDevices = [
        { device = "/dev/disk/by-uuid/593eea40-fe1c-4e4f-b130-74658b43b577"; }
      ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}
