{
  imports =
    [
      ./nixosModules
    ];

  services.flatpak.enable = true;

  system.stateVersion = "25.11";
}
