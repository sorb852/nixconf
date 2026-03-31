{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    initContent = ''
      # Move by word
      bindkey "^[[1;5D" backward-word
      bindkey "^[[1;5C" forward-word
      # Delete by word
      bindkey "^H" backward-kill-word
      bindkey "^[[4;5~" kill-word
    '';

    syntaxHighlighting.enable = true;

    shellAliases = {
      # Lowkey these two are useless
      # pioneer-rebuild = "git add ~/dotfiles && sudo nixos-rebuild switch";
      # pioneer-build = "git add ~/dotfiles && sudo nixos-rebuild build";
      cls = "clear";
      grep = "grep --color=auto"; # idk ripgrep is there too
      ls = "ls --color=auto"; # yeah good luck using this when theres eza
      e = "eza";
    };
  };
}
