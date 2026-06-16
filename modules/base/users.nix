{
  # Users
  flake.nixosModules.users =
    { pkgs, ... }:
    {
      users.users.sorb852 = {
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "dialout"
        ];
        shell = pkgs.zsh;
      };
    };
}
