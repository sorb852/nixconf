{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty
    pavucontrol
    python3
    gcc
    rustup
    fd
    fzf
    eza
    wget
    curl
    htop
    btop
    wl-clipboard
    yt-dlp
    spotdl
  ];
}
