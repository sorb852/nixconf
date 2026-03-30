{
  plugins.lsp = {
    enable = true;
    servers = {
      nixd.enable = true;
      clangd.enable = true;
    };
  };
}
