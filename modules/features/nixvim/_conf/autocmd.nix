{
  autoGroups = {
    # handles the cool ass highlight on yank thing
    # think i got it from lazyvim
    highlight_yank.clear = true;
  };
  autoCmd = [
    {
      pattern = "*";
      event = "TextYankPost";
      desc = "Highlight when yanking (copying) text";
      group = "highlight_yank";
      callback.__raw = ''
        function()
          vim.hl.on_yank { higroup = 'IncSearch', on_visual = true, timeout = 100 }
        end
      '';
    }
  ];
}
