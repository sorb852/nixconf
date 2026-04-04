{ pkgs, ... }:

{
  extraPackages = [ pkgs.python313Packages.pylatexenc ];

  plugins.render-markdown = {
    enable = true;
    settings = {
      # I think it enables lsp??
      # I don't know why they would have an lsp
      # for a markdown renderer but sure ig
      completions.lsp.enabled = true;
    };
  };
}
