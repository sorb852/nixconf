{ self, ... }:

{
  flake.nixosModules.programming =
    { pkgs, ... }:
    {
      imports = [ self.nixosModules.neovim ];
      environment.systemPackages = [
        pkgs.bun
        pkgs.python3
        pkgs.gcc
        pkgs.rustup
        pkgs.gdb
        pkgs.godot
      ];
    };
}
