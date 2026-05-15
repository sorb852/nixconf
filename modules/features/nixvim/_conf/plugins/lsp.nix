{
  plugins.lsp = {
    enable = true;
    servers = {
      nixd.enable = true;
      clangd.enable = true;
      ts_ls.enable = true;
      pyright.enable = true;
      taplo.enable = true;
      jsonls.enable = true;
      qmlls.enable = true;
      yamlls.enable = true;
      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };
      html.enable = true;
      svelte.enable = true;
      tailwindcss.enable = true;
    };
  };

  plugins.ts-autotag.enable = true;
  plugins.emmet.enable = true;
}
