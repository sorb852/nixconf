{
  flake.homeModules.quickshell =
    { pkgs, ... }:
    {
      programs.quickshell = {
        enable = true;
      };
      home.packages = with pkgs; [
        networkmanager
        upower # hopefully
      ];
    };
}
