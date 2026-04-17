{ pkgs, ... }:

let
  create_attr_list_mapping =
    {
      k,
      a,
      d ? null,
    }:
    {
      name = k;
      value = {
        action = a;
        options = {
          silent = true;
          desc = d;
        };
      };
    };
in
{
  extraPackages = with pkgs; [
    man
    man-db
  ];

  plugins.fzf-lua = {
    enable = true;
    # Get the newer release
    # package = rolling.vimPlugins.fzf-lua;
    keymaps = builtins.listToAttrs (
      map create_attr_list_mapping [
        {
          k = "<leader>sf";
          a = "files";
          d = "[S]earch [F]iles";
        }
        {
          k = "<leader>sb";
          a = "builtin";
          d = "[S]earch [B]uiltins";
        }
        {
          k = "<leader>sg";
          a = "live_grep";
          d = "[S]earch by [G]rep";
        }
        {
          k = "<leader>sk";
          a = "keymaps";
          d = "[S]earch [K]eymaps";
        }
        {
          k = "<leader>sc";
          a = "colorschemes";
          d = "[S]earch [C]olorschemes";
        }
        {
          k = "<leader>sm";
          a = "manpages";
          d = "[S]earch [M]an pages";
        }
        {
          k = "<leader>sh";
          a = "helptags";
          d = "[S]earch [H]elp";
        }
        {
          k = "<leader><leader>";
          a = "buffers";
          d = "Search buffers";
        }
        {
          # TODO: STYLE THIS
          k = "<leader>/";
          a = "lines";
          d = "Search buffer lines";
        }
      ]
    );
    settings.win-opts = {
      preview.default = "bat";
      preview.layout = "vertical";
      preview.vertical = "down|45%";
    };
  };

  # HACK (probably) FUCKING HORRIBLE
  keymaps = [
    {
      mode = "n";
      key = "<space>ss";
      action.__raw = ''
        function()
          local f = require('fzf-lua')
          local p = require('persisted')

          local s = p.list()
          f.fzf_exec(s, {
            prompt = "Sessions> ",
            actions = {
              ["default"] = function(selected)
                if selected and #selected > 0 then
                  local sesh_name = selected[1]
                  p.load({ session = sesh_name })
                end
              end
            }
          })
        end
      '';
      options = {
        desc = "[s]earch [s]essions";
        silent = true;
      };
    }
  ];
}
