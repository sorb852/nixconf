{
  plugins = {
    lualine.enable = true;
    web-devicons.enable = true;

    telescope.enable = true;
    oil.enable = true;
    lazygit.enable = true;

    luasnip.enable = true;
    treesitter.enable = true;
    lsp = {
      enable = true;
      servers = {
        nixd.enable = true;
      };
    };
  };
}
