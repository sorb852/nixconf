{ self, ... }:

{
  flake.nixosModules.starship =
    { pkgs, lib, ... }:
    {
      programs.zsh.interactiveShellInit = ''eval "$(${lib.getExe pkgs.starship} init zsh)"'';
      programs.starship =
        let
          fallbackPalette = {
            black = self.theme.shade0;
            white = self.theme.shade7;
            red = self.theme.accent0;
            yellow = self.theme.accent2;
            green = self.theme.accent3;
            cyan = self.theme.accent4;
            blue = self.theme.accent5;
            magenta = self.theme.accent7;

            # TODO: maybe add the catppuccin colors

            text = self.theme.shade6;
            subtext1 = self.theme.shade5;
            subtext0 = self.theme.shade4;

            overlay0 = self.theme.shade1;
            overlay1 = self.theme.shade2;
            overlay2 = self.theme.shade3;
            surface0 = self.theme.shade0;
            surface1 = self.theme.shade0;
            surface2 = self.theme.shade1;
            base = self.theme.shade0;
            mantle = self.theme.shade0;
            crust = self.theme.shade0;
          };
        in
        {
          enable = true;

          # I know, I could've just fromToml'd this whole thing.
          # But toml and nix don't differ much so I dont care.
          settings = {
            palettes = {
              fallback = fallbackPalette;
            };
            # palette = if self.preferences.useDisplay then "noctalia" else "fallback";
            palette = "fallback";

            add_newline = false;
            format = lib.concatStrings [
              "$os "
              "[-<](fg:overlay2) "
              "$directory$sudo"
              " [>-](fg:overlay2)"
              "$git_branch $character"
            ];
            right_format = "$nix_shell";

            os = {
              disabled = false;
              style = "fg:green";
              symbols = {
                NixOS = " ";
                Ubuntu = " ";
                Windows = " ";
              };
            };

            directory = {
              format = "[$path]($style)[$read_only]($read_only_style)";
              style = "text";
              read_only = " IOP";
              read_only_style = "fg:yellow";
            };

            # Seems to not work.
            sudo = {
              format = " [$symbol]($style)";
              disabled = true;
              symbol = "FA";
              style = "fg:yellow";
            };

            git_branch = {
              disabled = false;
              format = " [$symbol$branch(:$remote_branch)]($style)";
              symbol = "";
              style = "fg:blue";
            };

            character = {
              disabled = false;
              success_symbol = "[󰘧](fg:blue)";
              error_symbol = "[󰇂](fg:red)";
              vimcmd_symbol = "[󰏉](fg:blue)";
              vimcmd_visual_symbol = "[󰏉](fg:cyan)";
              vimcmd_replace_symbol = "[󰏉](fg:magenta)";
              vimcmd_replace_one_symbol = "[󰏉](fg:magenta)";
            };

            nix_shell = {
              disabled = false;
              format = " [$symbol$state $name]($style)";
              symbol = "󰼪 ";
              style = "fg:subtext1";
            };
          };
        };
    };
}
