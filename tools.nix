{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    fd
    fzf
    eza
    ranger

    wget
    curl

    wl-clipboard

    yt-dlp
    spotdl
  ];

  programs = {
    bat.enable = true;
    zoxide = {
      enable = true;
      enableBashIntegration = true;
    };

    git = {
      enable = true;
      config = {
        user.name = "sorb852";
        user.email = "reeldob34@gmail.com";
        init.defaultBranch = "main";
      };
    };
    lazygit = {
      enable = true;
      # To config
      # or not to
    };

    bash.enable = true;
    tmux = {
      enable = true;
      shortcut = "a";
      resizeAmount = 5;
      historyLimit = 10000;
      keyMode = "vi";
      baseIndex = 1;

      extraConfig = ''
# --- Basics ---
set -g mouse on # https://www.youtube.com/shorts/SnswGrb3e3s (no i dont use yt shorts)
set -g allow-rename off # trust you dont need to
set -g default-terminal "''${TERM}"        # Set default terminal
set -ga terminal-overrides ",''${TERM}:Tc" # yeah idk just smth related with colors
set -g renumber-windows on
set -g escape-time 0 # idk i trust the guy who said to use ts
set -g repeat-time 1000
set -g set-clipboard on

# --- Prefix Key ---
# unbind C-b
# set-option -g prefix C-a
# bind-key C-a send-prefix

# --- Pane Controls ---
bind | split-window -h
bind - split-window -v
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

bind -r H resize-pane -L 5
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5

# --- Window Controls ---
bind c new-window
bind & kill-window
bind * kill-pane
bind-key , command-prompt -I "#W" "rename-window '%%'" # Rename, I mean you dont need it but good to have ig
bind n next-window
bind p previous-window

bind Tab copy-mode \\;
bind v copy-mode \\; send-keys -X begin-selection
bind V copy-mode \\; send-keys -X select-line

# --- Reload Config ---
bind r source-file ~/.config/tmux/tmux.conf \\; display-message "tmux.conf reloaded!"

is_vim=\"ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?\\.?(view|n?vim?x?)(-wrapped)?(diff)?$'\"

bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h' { if -F '#{pane_at_left}' \'\' 'select-pane -L' }
bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j' { if -F '#{pane_at_bottom}' \'\' 'select-pane -D' }
bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k' { if -F '#{pane_at_top}' \'\' 'select-pane -U' }
bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l' { if -F '#{pane_at_right}' \'\' 'select-pane -R' }
bind-key -n 'C-n' if-shell "$is_vim" 'send-keys C-n' { if -F '#{window_end_flag}' \'\' 'select-window -n' }
bind-key -n 'C-p' if-shell "$is_vim" 'send-keys C-p' { if 'test #{window_index} -gt #{base-index}' 'select-window -p' }

bind-key -T copy-mode-vi 'C-h' if -F '#{pane_at_left}' \'\' 'select-pane -L'
bind-key -T copy-mode-vi 'C-j' if -F '#{pane_at_bottom}' \'\' 'select-pane -D'
bind-key -T copy-mode-vi 'C-k' if -F '#{pane_at_top}' \'\' 'select-pane -U'
bind-key -T copy-mode-vi 'C-l' if -F '#{pane_at_right}' \'\' 'select-pane -R'
bind-key -T copy-mode-vi 'C-n' if -F '#{window_end_flag}' \'\' 'select-window -n'
bind-key -T copy-mode-vi 'C-p' if 'test #{window_index} -gt #{base-index}' 'select-window -p'
'';
    };
  };
}
