{
  plugins.image = {
    enable = true;
    # # FIX: Terminal specific
    # backend = "kitty"; # or depends
  };

  plugins.molten = {
    enable = true;

    settings = {
      auto_image_popup = false;
      auto_init_behavior = "init";
      auto_open_html_in_browser = false;
      auto_open_output = true;
      cover_empty_lines = false;
      copy_output = false;
      enter_output_behavior = "open_then_enter";
      image_provider = "image.nvim";
      output_crop_border = true;
      output_virt_lines = false;
      output_win_border = [
        ""
        "━"
        ""
        ""
      ];
      output_win_hide_on_leave = true;
      output_win_max_height = 15;
      output_win_max_width = 80;
      save_path.__raw = "vim.fn.stdpath('data')..'/molten'";
      tick_rate = 500;
      use_border_highlights = false;
      limit_output_chars = 10000;
      wrap_output = false;
    };
  };

  plugins.notebook-navigator.enable = true;

  keymaps = [
    # Run the current cell
    {
      mode = "n";
      key = "<leader>X";
      action = "<cmd>lua require('notebook-navigator').run_cell()<cr>";
      options = {
        desc = "Run current cell";
        silent = true;
      };
    }
    # Run cell and move to the next one (great for stepping through)
    {
      mode = "n";
      key = "<leader>x";
      action = "<cmd>lua require('notebook-navigator').run_and_move()<cr>";
      options = {
        desc = "Run cell and move next";
        silent = true;
      };
    }
    # Jump between cells
    {
      mode = "n";
      key = "]x";
      action = "<cmd>lua require('notebook-navigator').move_cell 'd'<cr>";
      options = {
        desc = "Next cell";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "[x";
      action = "<cmd>lua require('notebook-navigator').move_cell 'u'<cr>";
      options = {
        desc = "Previous cell";
        silent = true;
      };
    }
  ];
}
