{ pkgs, ... }:

{
  extraPackages = with pkgs; [
    # Build confs
    git
    unzip
    gcc
    gnumake
    curl
    wget

    # Usage
    ripgrep
    fzf
    fd
    wl-clipboard

    # Runtime
    python3
    nodejs
  ];
}
