{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      # Lazy deps
      git
      unzip
      gnumake
      gcc

      # Plugin deps
      ripgrep
      fzf
      wl-clipboard

      # Mason deps
      nodejs_24
      python3
      cargo
      go
    ];
  };
  # home.file.".config/test".source = ../flake.nix;
  home.file.".config/test".source = ../nvim-config;
  # home.file.".config/nvim".source = ../nvim-config;
}
