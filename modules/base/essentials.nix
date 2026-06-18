{
  flake.nixosModules.essentials =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        wget
        curl

        # Debugging
        tldr
        # wikiman # Seems like i have to like wrap this thing to configure it, and install arch wiki manually (make direvations)
      ];

      programs = {
        git.enable = true;
        vim.enable = true;
        bash.enable = true;
        zsh.enable = true;
      };
    };
}
