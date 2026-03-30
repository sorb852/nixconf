let
  mapping = { k, a, d ? null, m ? ["n"] }: { action = a; key = k; mode = m; options.desc = d; };
in
{
  keymaps = [
    (mapping { k = "<leader>bd"; a = "<cmd>bd<CR>"; d = "[B]uffer [D]eletion"; })
    (mapping { k = "<C-s>"     ; a = "<cmd>w<CR>"; d = "Save"; })

    (mapping { k = "<esc>"    ; a = "<cmd>nohlsearch<CR>"; })
    (mapping { k = "<leader>g"; a = "<cmd>LazyGit<CR>"; d = "Open Lazy[g]it"; })

    (mapping { k = "<leader>e"       ; a = "<cmd>Oil<CR>"; d = "Open [E]xplorer";} )
  ];
}
