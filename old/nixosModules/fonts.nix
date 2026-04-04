{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    tewi-font
    nerd-fonts.hurmit

    ankacoder-condensed
    nerd-fonts.symbols-only
  ];
}
