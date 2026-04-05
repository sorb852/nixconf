{ self, ... }:

{
  imports = [ ./../../utils/theme.nix ];

  flake.homeModules.terminal = {
    programs.kitty = {

      enable = true;
      font.name = "Anka/Coder Condensed";
      font.size = 14;
      shellIntegration.enableZshIntegration = true;

      keybindings = {
        "kitty_mod+>" = "set_background_opacity +0.1";
        "kitty_mod+<" = "set_background_opacity -0.1";
      };

      settings =
        let
          # colutils = self.lib.colutils;
          # theme = (import self.lib.theme.config);
        in
        {
          kitty_mod = "ctrl+shift";

          cursor = theme.accent6;
          cursor_text_color = theme.shade0;
          cursor_shape = "block";
          cursor_trail = 1;
          cursor_trail_decay = "0.1 0.4";

          scrollbar_handle_color = theme.shade1;

          url_color = theme.accent5;
          url_style = "curly";

          background = theme.shade0;
          foreground = theme.shade7;

          selection_foreground = theme.shade2;
          selection_background = theme.accent4;

          # color0 = theme.shade0;
          # color1 = theme.accent0;
          # color2 = theme.accent3;
          # color3 = theme.accent2;
          # color4 = theme.accent5;
          # color5 = theme.accent7;
          # color6 = theme.accent4;
          # color7 = theme.shade6;
          #
          # color8 = colutils.brighten 0.25 theme.shade0;
          # color9 = colutils.brighten 0.2 theme.accent0;
          # color10 = colutils.brighten 0.2 theme.accent3;
          # color11 = colutils.brighten 0.2 theme.accent2;
          # color12 = colutils.brighten 0.2 theme.accent5;
          # color13 = colutils.brighten 0.2 theme.accent7;
          # color14 = colutils.brighten 0.2 theme.accent4;
          # color15 = theme.shade7;

          dynamic_background_opacity = true;
          background_opacity = 0.9;
          background_blur = 1;
        };
    };
  };
}
