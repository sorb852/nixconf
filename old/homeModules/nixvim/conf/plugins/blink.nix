{
  plugins.blink-cmp = {
    enable = true;
    setupLspCapabilities = true;
    settings = {
      keymap.preset = "enter";
      completion.documentation = { auto_show = true; auto_show_delay_ms = 500; };
      sources.default = [ "lsp" "buffer" "snippets" "path" ];
    };
  };
}
