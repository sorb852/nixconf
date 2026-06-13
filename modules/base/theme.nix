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

      # shade0 = "#0a0a0a";
      # shade1 = "#282828";
      # shade2 = "#464646";
      # shade3 = "#646464";
      # shade4 = "#838383";
      # shade5 = "#a1a1a1";
      # shade6 = "#bfbfbf";
      # shade7 = "#dddddd";
      #
      # accent0 = "#ffffff";
      # accent1 = "#ffffff";
      # accent2 = "#eeeeee";
      # accent3 = "#cccccc";
      # accent4 = "#b3b3b3";
      # accent5 = "#e0e0e0";
      # accent6 = "#ffffff";
      # accent7 = "#7e7e7e";

      # yeah im definetly abusing this
      # btw gotten from the goat vimjoyer
      shade0 = "#242424";
      shade1 = "#3c3836";
      shade2 = "#504945";
      shade3 = "#665c54";
      shade4 = "#bdae93";
      shade5 = "#d5c4a1";
      shade6 = "#ebdbb2";
      shade7 = "#fbf1c7";

      accent0 = "#fb4934";
      accent1 = "#fe8019";
      accent2 = "#fabd2f";
      accent3 = "#b8bb26";
      accent4 = "#8ec07c";
      accent5 = "#7daea3";
      accent6 = "#e089a1";
      accent7 = "#f28534";

      # shade0 = "#1e1e2e";
      # shade1 = "#33354c";
      # shade2 = "#494c69";
      # shade3 = "#5e6387";
      # shade4 = "#7479a5";
      # shade5 = "#8990c3";
      # shade6 = "#9fa7e0";
      # shade7 = "#b4befe";
      # accent0 = "#f38ba8";
      # accent1 = "#fab387";
      # accent2 = "#f9e2af";
      # accent3 = "#a6e3a1";
      # accent4 = "#94e2d5";
      # accent5 = "#89b4fa";
      # accent6 = "#cba6f7";
      # accent7 = "#f2cdcd";

      # shade0 = "#24273a";
      # shade1 = "#1e2030";
      # shade2 = "#363a4f";
      # shade3 = "#494d64";
      # shade4 = "#5b6078";
      # shade5 = "#cad3f5";
      # shade6 = "#f4dbd6";
      # shade7 = "#b7bdf8";
      # accent0 = "#ed8796";
      # accent1 = "#f5a97f";
      # accent2 = "#eed49f";
      # accent3 = "#a6da95";
      # accent4 = "#8bd5ca";
      # accent5 = "#8aadf4";
      # accent6 = "#c6a0f6";
      # accent7 = "#f0c6c6";

      lib = {
        inherit toRGB fromRGB brighten;
      };
    };
}
