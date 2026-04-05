{ self, ... }:

{
  flake.homeModules.starship =
    { lib, ... }:
    {
      programs.starship = {
        enable = true;
        enableZshIntegration = true;

        # I know, I could've just fromToml'd this whole thing.
        # But toml and nix don't differ much so I dont care.
        settings = {
          add_newline = false;
          format = lib.concatStrings [
            "$os "
            "[-<](fg:${self.theme.shade2}) "
            "$directory$sudo"
            " [>-](fg:${self.theme.shade2})"
            "$git_branch $character "
          ];
          right_format = "$nix_shell";

          os = {
            disabled = false;
            style = "fg:${self.theme.accent5}";
            symbols = {
              NixOS = " ";
              Ubuntu = " ";
              Windows = " ";
            };
          };

          directory = {
            format = "[$path]($style)[$read_only]($read_only_style)";
            style = "#ccceda";
            read_only = " IOP";
            read_only_style = "fg:#919bb1";
          };

          # Seems to not work.
          sudo = {
            format = " [$symbol]($style)";
            disabled = true;
            symbol = "FA";
            style = "fg:#919bb1";
          };

          git_branch = {
            disabled = false;
            format = " [$symbol$branch(:$remote_branch)]($style)";
            symbol = "";
            style = "fg:#414971";
          };

          character = {
            disabled = false;
            success_symbol = "[󰟢](fg:#414971)";
            error_symbol = "[󰇂](fg:#212B52)";
          };

          nix_shell = {
            disabled = false;
            format = " [$symbol$state $name]($style)";
            symbol = "󰼪 ";
            style = "fg:#3c465d";
          };
        };
      };
    };
}
