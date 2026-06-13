{ inputs, self, ... }:

{
  perSystem =
    { pkgs, ... }:
    {
      packages.eza = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.eza;
        flags = {
          "--icons" = "always";
        };
        flagSeparator = "=";
      };
    };

  flake.nixosModules.cli =
    { pkgs, ... }:
    {
      imports = [
        self.nixosModules.tmux
        self.nixosModules.shell
        self.nixosModules.starship
      ];

      environment.sessionVariables = {
        PAGER = "${pkgs.bat}";
      };

      # TODO: ykw js wrapp all these
      environment.systemPackages = [
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
        pkgs.fastfetch # TODO: Make seperate
        pkgs.ripgrep
        pkgs.fd
        pkgs.jq
        pkgs.btop
        pkgs.yt-dlp
        self.packages.${pkgs.system}.yazi
      ];

      programs = {
        bat.enable = true;
        fzf = {
          # idk i just now that this enables fzf
          fuzzyCompletion = true;
          keybindings = true;
        };
        zoxide = {
          enable = true;
          enableZshIntegration = true;
        };

        git = {
          enable = true;
          config = {
            user.name = "sorb852";
            user.email = "reeldob34@gmail.com";
            init.defaultBranch = "main";
          };
        };
        lazygit.enable = true;
        htop.enable = true;
      };
    };
}
