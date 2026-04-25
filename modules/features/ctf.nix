{ inputs, ... }:
{
  perSystem =
    {
      # lib,
      system,
      pkgs,
      ...
    }:
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
              pyshark
            '';
          };
        };

        packages = with pkgs; [
          burpsuite
          ghidra-bin
          hexedit
          binwalk
          tshark
          john
          steghide
          zsteg
          sqlmap
          exiftool
          termshark
          netcat-gnu
          lazysql
          bun
          nmap
        ];

        # env.LD_LIBRARY_PATH = "${lib.makeLibraryPath (
        #   with pkgs;
        #   [
        #     glibc
        #     zlib
        #     libc
        #   ]
        # )}";
        env._JAVA_AWT_WM_NONREPARENTING = 1;

      };
    };
}
