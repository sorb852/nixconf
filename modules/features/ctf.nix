{ inputs, ... }:
{
  perSystem =
    { system, pkgs, ... }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      # NOTE: Use `--no-pure-eval` when running `nix develop`
      # [source](https://devenv.sh/guides/using-with-flake-parts/#entering-the-shell)

      devenv.shells.ctf = {
        languages.python = {
          enable = true;
          version = "3.13";
          venv = {
            enable = true;
            requirements = ''
              pwntools
              pycryptodome
              requests
            '';
          };
        };

        packages = with pkgs; [
          burpsuite
          ghidra-bin
          hexedit
          binwalk
          john
          steghide
          zsteg
          sqlmap
          exiftool
          termshark
          netcat-gnu
          lazysql
          bun
        ];
      };
    };
}
