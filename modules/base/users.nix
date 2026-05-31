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
          "audio"
          "dialout"
        ];
        shell = pkgs.zsh;
      };
    };
}
