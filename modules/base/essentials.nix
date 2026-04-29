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
        wikiman
      ];

      programs = {
        git.enable = true;
        vim.enable = true;
        bash.enable = true;
        zsh.enable = true;
      };
    };
}
