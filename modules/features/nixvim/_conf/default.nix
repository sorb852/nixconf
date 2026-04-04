{ inputs, ... }:

{
  imports = [
    ./keymaps.nix
    ./opts.nix
    ./autocmd.nix
    ./dependencies.nix
    (inputs.import-tree ./plugins)
  ];
}
