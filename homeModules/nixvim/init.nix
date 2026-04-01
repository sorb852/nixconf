{
  imports = [
    ./keymaps.nix
    ./opts.nix
    ./plugins
    ./autocmd.nix
    ./dependencies.nix
  ];

  enable = true;
  defaultEditor = true;
}
