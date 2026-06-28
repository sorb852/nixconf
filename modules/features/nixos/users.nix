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
          "input"
        ];
        shell = pkgs.zsh;
      };
    };
}
