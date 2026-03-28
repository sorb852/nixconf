{ pkgs, ... }:

{
  imports = [
    ./homeModules/tmux.nix
  ];

  home.stateVersion = "25.11";
  home.username = "sorb852";
  home.homeDirectory = "/home/sorb852";

  home.packages = with pkgs; [
    kitty
    pavucontrol
    python3
    gcc
    rustup
    fd
    fzf
    eza
    ranger
    wget
    curl
    htop
    btop
    wl-clipboard
    yt-dlp
    spotdl
  ];

  wayland.windowManager.sway.enable = true;

  programs = {
    firefox.enable = true;

    vim.enable = true;
    # Doesnt work????
    neovim = {
      enable = true;
      viAlias = true;
      defaultEditor = true;
      # Didnt change much really
      # extraPackages = with pkgs; [
      #   git
      #   ripgrep
      #   python3
      #   lua
      # ];
    };

    bat.enable = true;
    zoxide = {
      enable = true;
      enableBashIntegration = true;
    };
    git = {
      enable = true;
      settings = {
        user.name = "sorb852";
        user.email = "reeldob34@gmail.com";
        init.defaultBranch = "main";
      };
    };
    lazygit.enable = true;
    bash = {
      enable = true;
      shellAliases = {
        rebuild = "sudo nixos-rebuild switch";
      };
    };
  };
}
