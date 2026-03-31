{ pkgs, ... }:

{
  # Users
  users.users.sorb852 = {
    isNormalUser = true;
    description = "sorbileg";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;

    # packages = with pkgs; [];
  };
}
