{
  flake.nixosModules.essentials =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        wget
        curl

        # I'm so sure you would atleast use `flake.homeModules.cli`
        home-manager

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
