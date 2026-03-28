{
  programs.tmux = {
    enable = true;
    mouse = true;
    baseIndex = 1;
    historyLimit = 10000;
    resizeAmount = 5;
    shortcut = "a";
    keyMode = "vi";
    customPaneNavigationAndResize = true;
    reverseSplit = true;

    extraConfig = ''
      bind r source-file ~/.config/tmux/tmux.conf \; display-message "tmux.conf reloaded!"

      set -g allow-rename off
      set -g renumber-windows on
    '';
  };
}
