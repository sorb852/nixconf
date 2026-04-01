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
  plugins.fzf-lua = {
    enable = true;
    keymaps = builtins.listToAttrs (
      map create_attr_list_mapping [
        {
          k = "<leader>sf";
          a = "files";
          d = "[S]earch [F]iles";
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
          k = "<leader><leader>";
          a = "buffers";
          d = "Search buffers";
        }
      ]
    );
    settings.win-opts = {
      preview.default = "bat";
      preview.layout = "vertical";
      preview.vertical = "down|45%";
    };
  };
}
