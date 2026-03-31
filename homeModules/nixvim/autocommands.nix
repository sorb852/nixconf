{
  autoCmd = [
    {
      event = "TextYankPost";
      desc = "Highlight when yanking (copying) text";
      callback.__raw = ''
        function() vim.hl.on_yank({ timeout = 500 }) end
      '';
    }
  ];
}
