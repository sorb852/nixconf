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
      d = "[b]uffer [d]eletion";
    })
    (mapping {
      k = "<leader>bD";
      a = "<cmd>bd|e#<CR>";
      d = "[b]uffer [D]elete others";
    })
    (mapping {
      k = "<C-s>";
      a = "<cmd>w<CR>";
    })
    (mapping {
      k = "<C-w>.";
      a = "<cmd>qa<CR>";
      d = "Quit neovim";
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
      k = "s";
      a = {
        __raw = "require('flash').jump";
      };
      d = "Flash";
      m = [
        "n"
        "x"
        "o"
      ];
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
    (mapping {
      k = "zR";
      a = {
        __raw = ''
          function()
            require('ufo').openAllFolds()
          end
        '';
      };
      d = "Open all folds";
    })
    (mapping {
      k = "zM";
      a = {
        __raw = ''
          function()
            require('ufo').closeAllFolds()
          end
        '';
      };
      d = "Close all folds";
    })
  ];
}
