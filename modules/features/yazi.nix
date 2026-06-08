{ inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.yazi = inputs.wrappers.wrappers.yazi.wrap { inherit pkgs; };
    };
}
