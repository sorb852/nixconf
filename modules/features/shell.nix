{ self, ... }:

{
  flake.homeModules.shell = {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion = {
        enable = true;
        highlight = "fg=${self.theme.shade1}";
      };
      initContent = ''
        # Move by word
        bindkey "^[[1;5D" backward-word
        bindkey "^[[1;5C" forward-word
        # Delete by word
        bindkey "^H" backward-kill-word
        bindkey "^[[4;5~" kill-word

        # TMUX my love
        if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
          exec tmux
        fi
      '';

      syntaxHighlighting.enable = true;

      shellAliases = {
        cls = "clear";
        grep = "grep --color=auto"; # idk ripgrep is there too
        ls = "ls --color=auto"; # yeah good luck using this when theres eza
        e = "eza";
      };
    };
  };
}
