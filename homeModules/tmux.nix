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

      bind Tab copy-mode \;
      # bind v copy-mode \; send-keys -X begin-selection
      # bind V copy-mode \; send-keys -X select-line
      # bind -T copy-mode-vi v send -X begin-selection
      bind -T copy-mode-vi y send -X copy-selection-and-cancel

      set -g allow-rename off
      set -g renumber-windows on
    '';
  };
}
