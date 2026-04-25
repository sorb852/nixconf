{
  flake.homeModules.tmux = {
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
      terminal = "xterm-kitty";

      extraConfig = ''
        bind 'v' split-window -h -c "#{pane_current_path}"
        bind 's' split-window -c "#{pane_current_path}"

        bind r source-file ~/.config/tmux/tmux.conf \; display-message "tmux.conf reloaded!"

        bind Tab copy-mode
        bind -T copy-mode-vi v      send-keys -X begin-selection
        bind -T copy-mode-vi V      send-keys -X select-line
        bind -T copy-mode-vi y      send -X copy-selection-and-cancel
        bind -T copy-mode-vi Escape send -X cancel

        set -g allow-rename off
        set -g renumber-windows on
      '';
    };
  };
}
