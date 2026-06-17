{ self, pkgs, ... }:

{
  # colorscheme = "catppuccin-mocha";
  colorschemes.base16 = {
    enable = true;
    colorscheme = {
      base00 = "${self.theme.shade0}";
      base01 = "${self.theme.shade1}";
      base02 = "${self.theme.shade2}";
      base03 = "${self.theme.shade3}";
      base04 = "${self.theme.shade4}";
      base05 = "${self.theme.shade5}";
      base06 = "${self.theme.shade6}";
      base07 = "${self.theme.shade7}";
      base08 = "${self.theme.accent0}";
      base09 = "${self.theme.accent1}";
      base0A = "${self.theme.accent2}";
      base0B = "${self.theme.accent3}";
      base0C = "${self.theme.accent4}";
      base0D = "${self.theme.accent5}";
      base0E = "${self.theme.accent6}";
      base0F = "${self.theme.accent7}";
    };
  };
  extraPlugins = with pkgs.vimPlugins; [
    gruvbox-nvim
    catppuccin-nvim
    kanagawa-nvim
    rose-pine
    tokyonight-nvim
    vague-nvim
  ];
}
