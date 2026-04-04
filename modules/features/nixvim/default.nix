{ inputs, ... }:

{
  perSystem =
    {
      system,
      pkgs,
      ...
    }:
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
      checks.default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;

      packages.neovim = nvim;
    };
}
