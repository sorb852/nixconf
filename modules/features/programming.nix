{ self, ... }:

{
  flake.homeModules.programming =
    { pkgs, ... }:
    {
      # TODO: import nixvim
      home.packages = [
        pkgs.python3
        # (pkgs.python3.withPackages (python-pkgs: [
        #   python-pkgs.python
        # ]))
        pkgs.gcc
        pkgs.rustup
        pkgs.gdb
        self.packages.${pkgs.system}.neovim
      ];
    };
}
