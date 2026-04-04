{ inputs, ... }:

{
  perSystem =
    { system, pkgs, ... }:
    let
      nixvim' = inputs.nixvim.legacyPackages.${system};
      nixvimLib = inputs.nixvim.lib.${system};
      nixvimModule = {
        inherit pkgs;
        module = ./_conf;
        extraSpecialArgs = {
          inherit inputs;
        };
      };
      nvim = nixvim'.makeNixvimWithModule nixvimModule;
    in
    {
      # Run `nix flake check .` to verify that your config is not broken
      # For now though, we may have to ignore this
      # Really I'm too lazy to fix this
      # I guess
      # FIX: yeah this is broken
      # checks = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;

      packages.neovim = nvim;
    };
}
