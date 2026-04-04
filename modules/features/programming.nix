{
  flake.homeModules.programming =
    { pkgs, ... }:
    {
      # TODO: import nixvim
      home.packages = with pkgs; [
        python3
        gcc
        rustup
      ];
    };
}
