{ inputs, pkgs, ... }:

{
  home.packages = [
    inputs.nvim-conf.packages.${pkgs.system}.default
  ];
}
