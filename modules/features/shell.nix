{
  flake.homeModules.shell =
    { lib, pkgs, ... }:
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

          # do i even need to do ts??
          # like clear, grep and ls will always be in a system so
          cls = "${lib.getExe' pkgs.toybox "clear"}";
          grep = "${lib.getExe pkgs.gnugrep} --color=auto"; # idk ripgrep is there too
          ls = "${lib.getExe' pkgs.coreutils "ls"}--color=auto"; # yeah good luck using this when theres eza
          e = "${lib.getExe pkgs.eza}";
        };
      };
    };
}
