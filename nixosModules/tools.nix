{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    wget
    curl

    wl-clipboard
  ];

  programs = {
    git.enable = true;
    vim.enable = true;
    bash.enable = true;
  };
}
