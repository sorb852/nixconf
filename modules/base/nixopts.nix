{
  flake.nixosModules.nixopts = {
    # idk for steam and some other stuff
    nixpkgs.config.allowUnfree = true;

    # i love flakes i think idk
    # were kind of in an abusive relatiion ship
    # but trust me i can fix er
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  flake.homeModules.nixopts = {
    # idk for steam and some other stuff
    nixpkgs.config.allowUnfree = true;
  };

  # perSystem =
  #   {
  #     inputs',
  #     system,
  #     ...
  #   }:
  #   {
  #     _module.args.pkgs = import inputs'.nixpkgs {
  #       inherit system;
  #       # config = {
  #       #   allowUnfree = true;
  #       # };
  #     };
  #   };
}
