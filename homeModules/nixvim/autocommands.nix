{
  autoCmd = [
    {
      pattern = "*";
      event = "TextYankPost";
      desc = "Highlight when yanking (copying) text";
      group = "highlight_yank";
      callback.__raw = ''
        function()
          vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
        end
      '';
    }
  ];
}
