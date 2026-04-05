{ self, ... }:

{
  flake.homeModules.terminal = {
    programs.kitty = {

      enable = true;
      font.name = "Anka/Coder Condensed";
      font.size = 14;
      shellIntegration.enableZshIntegration = true;

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
