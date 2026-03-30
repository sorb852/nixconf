{
  programs.bash = {
    enable = true;
    shellAliases = {
      pioneer-rebuild = "git add ~/dotfiles && sudo nixos-rebuild switch";
      pioneer-build = "git add ~/dotfiles && sudo nixos-rebuild build";
      cls = "clear";
      grep = "grep --color=auto"; # idk ripgrep is there too
      ls = "ls --color=auto"; # yeah good luck using this when theres eza
      e = "eza";
    };
  };
}
