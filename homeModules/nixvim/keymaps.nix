let
  mapping = { k, a, m ? ["n"] }: { action = a; key = k; mode = m; };
in
{
  keymaps = [
    (mapping { k = "<esc>"    ; a = "<cmd>nohlsearch<CR>"; })
    (mapping { k = "<leader>g"; a = "<cmd>LazyGit<CR>"; })

    (mapping { k = "<leader>sg"; a = "<cmd>Telescope live_grep<CR>"; })
    (mapping { k = "<leader>sf"; a = "<cmd>Telescope find_files<CR>"; })
    (mapping { k = "<leader>e" ; a = "<cmd>Oil<CR>"; })
  ];
}
