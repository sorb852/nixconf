{ self, ... }:

{
  flake.homeModules.cli =
    { pkgs, ... }:
    {
      imports = [
        self.homeModules.tmux
        self.homeModules.shell
        self.homeModules.starship
      ];

      home.packages = with pkgs; [
        wget
        curl
        wl-clipboard
        spotdl
      ];

      programs = {
        bat.enable = true;
        bun.enable = true;
        fzf = {
          enable = true;
          enableZshIntegration = true;
        };
        eza = {
          enable = true;
          enableZshIntegration = true;
          extraOptions = [
            "--icons=always"
          ];
        };
        zoxide = {
          enable = true;
          enableZshIntegration = true;
        };
        ripgrep.enable = true;
        jq.enable = true;
        fd.enable = true;

        git = {
          enable = true;
          settings = {
            user.name = "sorb852";
            user.email = "reeldob34@gmail.com";
            init.defaultBranch = "main";
          };
        };
        lazygit = {
          enable = true;
          enableZshIntegration = true;
        };

        htop.enable = true;
        btop.enable = true;
        ranger.enable = true; # TODO: To config
        yt-dlp.enable = true;
      };
    };
}
