{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    curl
  ];

  programs = {
    git.enable = true;
    vim.enable = true;
    bash.enable = true;
  };
}
