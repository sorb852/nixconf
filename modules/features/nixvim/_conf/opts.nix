{ pkgs, ... }:

{
  editorconfig.enable = true;

  globals.mapleader = " ";

  opts = {
    number = true;
    relativenumber = true;

    shiftwidth = 2;

    wrap = false;

    signcolumn = "yes";
    cursorline = true;

    foldcolumn = "1";
    foldlevel = 99;
    foldlevelstart = 99;
    foldenable = true;

    exrc = true;
    secure = true;

    clipboard = "unnamedplus";
  };

  colorscheme = "catppuccin-mocha";
  extraPlugins = with pkgs.vimPlugins; [
    gruvbox-nvim
    catppuccin-nvim
    kanagawa-nvim
    rose-pine
    tokyonight-nvim
    vague-nvim
  ];

  # Not found for some reason???
  # Like it's on the docs tf they on
  # waylandSupport = true;
  viAlias = true;
}
