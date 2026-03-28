
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    python3
    gcc
    rustup
  ];

  programs = {
    vim.enable = true;
    neovim = {
      enable = true;
      viAlias = true;
      defaultEditor = true;
    };
  };
}
