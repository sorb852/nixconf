{ config, pkgs, ... }:

{
  home.stateVersion = "25.11";
  home.username = "sorb852";
  home.homeDirectory = "/home/sorb852";
  home.packages = with pkgs; [
    kitty
    pavucontrol
    neovim

    python3
    gcc
    rustup

    fd
    fzf
    eza
    ranger
    wget
    curl
    wl-clipboard
    yt-dlp
    spotdl
  ];
  programs = {
    firefox.enable = true;

    vim.enable = true;
    # Doesnt work????
    #neovim = {
    #  enable = true;
    #  viAlias = true;
    #  defaultEditor = true;
    #};

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
    bash.enable = true;
    tmux = {
      enable = true;
      mouse = true;
      shortcut = "a";
      prefix = "C-a";
      resizeAmount = 5;
      historyLimit = 10000;
      keyMode = "vi";
      baseIndex = 1;
    };
  };
}
