{ pkgs, ... }:

{
  extraPackages = with pkgs; [
    prettier
    clang-tools
    nixfmt
  ];

  plugins.conform-nvim = {
    enable = true;

    settings = {
      format_on_save = {
        lsp_fallback = true;
      };
      notify_on_error = true;
      notify_no_formatters = true;

      formatters_by_ft = {
        cpp = [ "clang-format" ];
        nix = [ "nixfmt" ];
      };
    };
  };
}
