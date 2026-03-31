{
  programs.kitty = {
    enable = true;
    font.name = "Anka/Coder Condensed";
    font.size = 11;
    shellIntegration.enableBashIntegration = true;

    settings = {
      cursor_shape = "block";
      cursor_trail = 1;
      cursor_trail_decay = "0.1 0.4";
      dynamic_background_opacity = true;
      background_opacity = 0.9;
      background_blur = 1;
    };
  };
}
