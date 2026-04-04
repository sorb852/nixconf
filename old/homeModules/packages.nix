{ pkgs, ... }:

{
  home.packages = with pkgs; [
    pavucontrol
    python3
    gcc
    rustup
    fd
    fzf
    wget
    curl
    htop
    btop
    wl-clipboard
    yt-dlp
    spotdl
    ripgrep
    jq
  ];
}
