{
  plugins.mini-pairs.enable = true;
  plugins.mini-ai.enable = true;
  plugins.mini-cursorword.enable = true;
  plugins.mini-notify.enable = true;
  plugins.mini-bufremove.enable = true;
  plugins.mini-surround = {
    enable = true;
    settings.mappings = {
      add = "gsa";
      delete = "gsd";
      replace = "gsr";

      find = "gsf";
      find_left = "gsF";
      highlight = "gsh";
      suffix_last = "gl";
      suffix_next = "gn";
    };
  };
}
