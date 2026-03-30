{ pkgs, inputs, ... }:

{
  programs.neovim = {

    defaultEditor = true;
    extraPackages = with pkgs; [
      # Lazy deps
      git
      unzip
      gnumake
      gcc

      # Plugin deps
      ripgrep
      fzf
      # wl-clipboard

      # Mason deps
      nodejs_24
      python3
      cargo
      go
    ];
  };

  imports = [ inputs.nixvim.homeModules.nixvim ];
  programs.nixvim = {
    enable = true;

    editorconfig.enable = true;

    globals.mapleader = " ";

    # opts = {
    #   number = true;
    #   relativenumber = true;
    #
    #   shiftwidth = "2";
    #
    #   clipboard = "unnamedplus";
    # };
    
    keymaps = [
      {
        action = "<cmd>nohlsearch<CR>";
        key = "<esc>";
      }

      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>sg";
      }
      {
        action = "<cmd>Telescope find_files<CR>";
        key = "<leader>sf";
      }
      {
        action = "<cmd>Oil<CR>";
        key = "<leader>e";
      }
    ];

    colorschemes.catppuccin.enable = true;

    plugins = {
      lualine.enable = true;
      web-devicons.enable = true;

      telescope.enable = true;
      oil.enable = true;

      luasnip.enable = true;
      treesitter.enable = true;
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
        };
      };
    };
  };

  # Not found for some reason???
  # Like it's on the docs tf they on
  # waylandSupport = true;
  # viAlias = true;
}
