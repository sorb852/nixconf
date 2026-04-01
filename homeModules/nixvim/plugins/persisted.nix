{ inputs, rolling, ... }:

{
  # This loads btw
  plugins.persisted = {
    enable = true;
    package = rolling.vimPlugins.persisted-nvim;
  };
}
