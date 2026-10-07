{ inputs, self, ... }:

{
  flake.nixosModules.kitty =
    { pkgs, ... }:
    {
      environment.systemPackages = [ self.packages.${pkgs.system}.kitty ];
    };

  perSystem =
    { pkgs, ... }:
    {
      packages.kitty = inputs.wrappers.wrappers.kitty.wrap {
        inherit pkgs;
        runtimePkgs = [ pkgs.ankacoder-condensed ];

        extraConfig = "symbol_map U+e000-U+e00a,U+e0a0-U+e0a2,U+e0a3,U+e0b0-U+e0b3,U+e0b4-U+e0c8,U+e0ca,U+e0cc-U+e0d7,U+e200-U+e2a9,U+e300-U+e3e3,U+e5fa-U+e6b7,U+e700-U+e8ef,U+ea60-U+ec1e,U+ed00-U+efce,U+f000-U+f2ff,U+f300-U+f381,U+f400-U+f533,U+f0001-U+f1af0 Symbols Nerd Font";

        font.name = "Anka/Coder Condensed";
        font.size = 14;

        keybindings = {
          "kitty_mod+a>." = "set_background_opacity +0.1";
          "kitty_mod+a>," = "set_background_opacity -0.1";
        };

        settings = {
          kitty_mod = "ctrl+shift";

          cursor = self.theme.accent6;
          cursor_text_color = self.theme.shade0;
          cursor_shape = "block";
          cursor_trail = 1;
          cursor_trail_decay = "0.1 0.4";

          window_padding_width = 2;

          scrollbar_handle_color = self.theme.shade1;

          url_color = self.theme.accent5;
          url_style = "curly";

          background = self.theme.shade0;
          foreground = self.theme.shade7;

          selection_foreground = self.theme.shade2;
          selection_background = self.theme.accent4;

          color0 = self.theme.shade0;
          color1 = self.theme.accent0;
          color2 = self.theme.accent3;
          color3 = self.theme.accent2;
          color4 = self.theme.accent5;
          color5 = self.theme.accent7;
          color6 = self.theme.accent4;
          color7 = self.theme.shade6;

          color8 = self.theme.lib.brighten 0.25 self.theme.shade0;
          color9 = self.theme.lib.brighten 0.2 self.theme.accent0;
          color10 = self.theme.lib.brighten 0.2 self.theme.accent3;
          color11 = self.theme.lib.brighten 0.2 self.theme.accent2;
          color12 = self.theme.lib.brighten 0.2 self.theme.accent5;
          color13 = self.theme.lib.brighten 0.2 self.theme.accent7;
          color14 = self.theme.lib.brighten 0.2 self.theme.accent4;
          color15 = self.theme.shade7;

          dynamic_background_opacity = true;
          background_opacity = 0.8;
          background_blur = 1;
        };
      };
    };
}
