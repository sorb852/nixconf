{ self, ... }:

{
  flake.homeModules.programming =
    { pkgs, ... }:
    {
      # TODO: import nixvim
      home.packages = [
        pkgs.python3
        pkgs.gcc
        pkgs.rustup
        pkgs.gdb
        self.packages.${pkgs.system}.neovim
      ];
    };
}
