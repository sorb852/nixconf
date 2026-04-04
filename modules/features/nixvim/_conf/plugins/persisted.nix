# { pkgs, ... }:

{
  # This loads btw
  plugins.persisted = {
    enable = true;
    # package = pkgs.vimPlugins.persisted-nvim;
  };
}
