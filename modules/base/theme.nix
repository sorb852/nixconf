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
      # js use matugen lowk
      # look i will get a dark theme but the one we have rn is SO ASS
      # this mogs anyways
      # shade0 = "#dadee9";
      # shade1 = "#bcc1cc";
      # shade2 = "#9fa4af";
      # shade3 = "#828792";
      # shade4 = "#656976";
      # shade5 = "#484c59";
      # shade6 = "#2a2f3c";
      # shade7 = "#0d121f";
      # accent0 = "#69738c";
      # accent1 = "#525b72";
      # accent2 = "#464f65";
      # accent3 = "#929cb0";
      # accent4 = "#3f485d";
      # accent5 = "#3a4356";
      # accent6 = "#363e51";
      # accent7 = "#30374b";

      # shade0 = "#0d121f";
      # shade1 = "#2a2f3c";
      # shade2 = "#484c59";
      # shade3 = "#656976";
      # shade4 = "#828792";
      # shade5 = "#9fa4af";
      # shade6 = "#bcc1cc";
      # shade7 = "#dadee9";
      # accent0 = "#69738c";
      # accent1 = "#525b72";
      # accent2 = "#464f65";
      # accent3 = "#929cb0";
      # accent4 = "#3f485d";
      # accent5 = "#3a4356";
      # accent6 = "#363e51";
      # accent7 = "#30374b";

      # potential 👀👀
      shade0 = "#222633";
      shade1 = "#434754";
      shade2 = "#646975";
      shade3 = "#858a96";
      shade4 = "#a7acb7";
      shade5 = "#c8cdd8";
      shade6 = "#d0d5de";
      shade7 = "#d8dce4";
      accent0 = "#567c9d";
      accent1 = "#959ba4";
      accent2 = "#9493a6";
      accent3 = "#6b77a0";
      accent4 = "#68789b";
      accent5 = "#6778a1";
      accent6 = "#6b7898";
      accent7 = "#6c7898";

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
      # accent0 = "#fb4934";
      # accent1 = "#fe8019";
      # accent2 = "#fabd2f";
      # accent3 = "#b8bb26";
      # accent4 = "#8ec07c";
      # accent5 = "#7daea3";
      # accent6 = "#e089a1";
      # accent7 = "#f28534";

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
