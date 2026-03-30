# { inputs, ... }:

{
  imports = [
    # inputs.nixvim.homeModules.nixvim
    ./keymaps.nix
    ./opts.nix
    ./plugins.nix
  ];

  enable = true;
}
