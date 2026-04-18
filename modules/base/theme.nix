{ inputs, ... }:
{
  flake.theme =
    let
      inherit (inputs.nixpkgs) lib;
      toRGB =
        let
          slice = p: h: builtins.substring p 2 h;
          dec = h: lib.fromHexString h;
        in
        hex: {
          r = dec (slice 1 hex);
          g = dec (slice 3 hex);
          b = dec (slice 5 hex);
        };

      fromRGB =
        let
          slice = h: builtins.substring (builtins.stringLength h - 6) 6 h;
          f = n: lib.toHexString n;
        in
        {
          r,
          g,
          b,
        }:
        "#" + slice ("000000" + (f (r * 65536 + g * 256 + b)));

      brighten =
        v: h:
        let
          rgb = toRGB h;
          lerp =
            n:
            let
              res = n + (builtins.floor ((255 - n) * v));
            in
            if res < 0 then
              0
            else if res > 255 then
              255
            else
              res;
        in
        fromRGB {
          r = lerp rgb.r;
          g = lerp rgb.g;
          b = lerp rgb.b;
        };
    in
    {
      shade0 = "#0c101e";
      shade1 = "#2c303d";
      shade2 = "#4c4f5d";
      shade3 = "#6c6f7c";
      shade4 = "#8c8f9b";
      shade5 = "#acafba";
      shade6 = "#ccceda";
      shade7 = "#eceef9";

      accent0 = "#212B52";
      accent1 = "#202735";
      accent2 = "#919bb1";
      accent3 = "#afbbd6";
      accent4 = "#3c465d";
      accent5 = "#414971";
      accent6 = "#3c465d";
      accent7 = "#293256";

      lib = {
        inherit toRGB fromRGB brighten;
      };
    };
}
