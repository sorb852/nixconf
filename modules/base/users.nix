{
  # Users
  flake.nixosModules.users =
    { pkgs, ... }:
    {
      users.users.sorb852 = {
        isNormalUser = true;
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        shell = pkgs.zsh;
      };
    };
}
