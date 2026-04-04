{ pkgs, ... }:

{
  plugins.treesitter = {
    enable = true;
    settings = {
      highlight.enable = true;
      indent.enable = true;
      folding.enable = true;
    };

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter-parsers; [
      nix
      c
      cpp
      qmljs
      toml
    ];
  };
}
