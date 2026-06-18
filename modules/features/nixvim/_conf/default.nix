{ inputs, ... }:

{
  imports = [
    ./keymaps.nix
    ./opts.nix
    ./autocmd.nix
    ./dependencies.nix
    ./colors.nix
    (inputs.import-tree ./plugins)
  ];
}
