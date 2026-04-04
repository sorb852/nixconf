let
  mapping =
    {
      k,
      a,
      d ? null,
      m ? [ "n" ],
    }:
    {
      action = a;
      key = k;
      mode = m;
      options.desc = d;
    };
in
{
  keymaps = [
    (mapping {
      k = "<leader>bd";
      a = "<cmd>bd<CR>";
      d = "[B]uffer [D]eletion";
    })
    (mapping {
      k = "<C-s>";
      a = "<cmd>w<CR>";
    })
    (mapping {
      k = "<C-w>.";
      a = "<cmd>qa<CR>";
      d = "Quit project";
      m = [
        "n"
        "i"
      ];
    })
    (mapping {
      k = "U";
      a = "<C-r>";
    })

    (mapping {
      k = "<esc>";
      a = "<cmd>nohlsearch<CR>";
    })
    (mapping {
      k = "<leader>g";
      a = "<cmd>LazyGit<CR>";
      d = "Open Lazy[g]it";
    })

    (mapping {
      k = "<leader>e";
      a = "<cmd>Oil<CR>";
      d = "Open [E]xplorer";
    })
    (mapping {
      k = "<leader>f";
      a = {
        __raw = ''
          function()
            require('conform').format({ async = true, lsp_fallback = true })
          end
        '';
      };
      d = "[F]ormat file";
    })
  ];
}
