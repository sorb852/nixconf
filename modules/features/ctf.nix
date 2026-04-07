{
  flake.homeModules.ctf =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
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
        python3
        python313Packages.requests
        python313Packages.pycryptodome
        # (pkgs.python3.withPackages (python-pkgs: [
        #   python-pkgs.requests
        #   python-pkgs.pycryptodome
        # ]))
      ];
      programs = {
        lazysql.enable = true;
        bun.enable = true; # look yeah i know, but sometimes i just love my fetch
      };

    };
}
