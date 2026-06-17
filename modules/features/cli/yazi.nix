{ inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      # TODO: Configure
      packages.yazi = inputs.wrappers.wrappers.yazi.wrap { inherit pkgs; };
    };
}
