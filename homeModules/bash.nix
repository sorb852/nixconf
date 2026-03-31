# { pkgs, ... }:

{
  # home.packages = with pkgs; [
  #   blesh
  # ];

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      #[[ $- == *i* ]] && source -- "$(blesh-share)"/ble.sh --attach=none
      # ...
      #[[ ! ''${BLE_VERSION-} ]] || ble-attach
    '';
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
