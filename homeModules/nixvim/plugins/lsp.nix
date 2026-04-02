{
  plugins.lsp = {
    enable = true;
    servers = {
      nixd.enable = true;
      clangd.enable = true;
      ts_ls.enable = true;
      pyright = {
        enable = true;
      };
    };
  };
}
