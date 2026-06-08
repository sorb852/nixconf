{ self, ... }:

{
  flake.homeModules.cli =
    { pkgs, ... }:
    {
      imports = [
        self.homeModules.tmux
        self.homeModules.shell
        self.homeModules.starship
        self.homeModules.fastfetch
      ];

      home.packages = [
        pkgs.wget
        pkgs.curl
        pkgs.wl-clipboard
        pkgs.spotdl
        pkgs.unzip
        pkgs.p7zip
        pkgs.unrar
        pkgs.mpv
        pkgs.devenv
        pkgs.file
        pkgs.tldr
        self.packages.${pkgs.system}.yazi
      ];

      home.sessionVariables = {
        EDITOR = "nvim";
        MANPAGER = "nvim +Man!";
        PAGER = "bat";
      };

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
        yt-dlp.enable = true;
      };
    };
}
