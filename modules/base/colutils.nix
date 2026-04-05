{ inputs, ... }:

{
  flake.lib.colutils =
    { self, ... }:
    {
      # Jeez these things are a brain teaser
      toRGB =
        let
          slice = p: h: builtins.substring p 2 h;
          dec = h: inputs.nixpkgs.lib.fromHexString h;
        in
        hex: {
          r = dec (slice 1 hex);
          g = dec (slice 3 hex);
          b = dec (slice 5 hex);
        };

      fromRGB =
        let
          slice = h: builtins.substring (builtins.stringLength h - 6) 6 h;
          f = n: inputs.nixpkgs.lib.toHexString n;
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
          rgb = self.config.toRGB h;
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
              0;
        in
        self.config.fromRGB {
          r = lerp rgb.r;
          g = lerp rgb.g;
          b = lerp rgb.b;
        };
    };
}
