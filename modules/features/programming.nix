{ self, ... }:

{
  flake.homeModules.programming =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.python3
        pkgs.gcc
        pkgs.rustup
        pkgs.gdb
        pkgs.godot
        self.packages.${pkgs.system}.neovim
      ];
    };
}
