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
      # shade0 = "#0f0f0f";
      # shade1 = "#2f2f2f";
      # shade2 = "#4f4f4f";
      # shade3 = "#6f6f6f";
      # shade4 = "#909090";
      # shade5 = "#b0b0b0";
      # shade6 = "#d0d0d0";
      # shade7 = "#f0f0f0";
      #
      # accent0 = "#303030";
      # accent1 = "#b0b0b0";
      # accent2 = "#888888";
      # accent3 = "#ffffff";
      # accent4 = "#c4c4c4";
      # accent5 = "#7f7f7f";
      # accent6 = "#555555";
      # accent7 = "#5f5f5f";

      shade0 = "#0a0a0a";
      shade1 = "#282828";
      shade2 = "#464646";
      shade3 = "#646464";
      shade4 = "#838383";
      shade5 = "#a1a1a1";
      shade6 = "#bfbfbf";
      shade7 = "#dddddd";

      accent0 = "#ffffff";
      accent1 = "#ffffff";
      accent2 = "#eeeeee";
      accent3 = "#cccccc";
      accent4 = "#b3b3b3";
      accent5 = "#e0e0e0";
      accent6 = "#ffffff";
      accent7 = "#7e7e7e";

      # yeah im definetly abusing this
      # btw gotten from the goat vimjoyer
      # shade0 = "#242424";
      # shade1 = "#3c3836";
      # shade2 = "#504945";
      # shade3 = "#665c54";
      # shade4 = "#bdae93";
      # shade5 = "#d5c4a1";
      # shade6 = "#ebdbb2";
      # shade7 = "#fbf1c7";
      #
      # accent0 = "#fb4934";
      # accent1 = "#fe8019";
      # accent2 = "#fabd2f";
      # accent3 = "#b8bb26";
      # accent4 = "#8ec07c";
      # accent5 = "#7daea3";
      # accent6 = "#e089a1";
      # accent7 = "#f28534";

      lib = {
        inherit toRGB fromRGB brighten;
      };
    };
}
