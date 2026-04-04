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
}
