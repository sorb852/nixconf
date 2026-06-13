{ inputs, self, ... }:

{
  flake.nixosModules.niri =
    { pkgs, lib, ... }:
    {
      programs.zsh.interactiveShellInit = ''
        # niri my love
        eval "$(${lib.getExe pkgs.niri} completions zsh)"
      '';

      environment.systemPackages = [ self.packages.${pkgs.system}.niri ];
    };

  perSystem =
    { pkgs, ... }:
    {
      packages.niri = inputs.wrappers.wrappers.niri.wrap {
        inherit pkgs;
        runtimePkgs = [
          pkgs.xwayland-satellite
          pkgs.noctalia-shell
        ];
        extraSettings = [
          {
            include = [
              { optional = true; }
              "~/.config/niri/noctalia.kdl"
            ];
          }
        ];
        settings = {
          prefer-no-csd = true;
          layout = {
            gaps = 16;
            # always-center-single-column = _: { };
            background-color = "${self.theme.shade0}";
            struts = {
              left = 4;
              right = 4;
            };
            tab-indicator = {
              off = _: { };
            };
          };
          input = {
            keyboard = {
              xkb = {
                layout = "us,mn";
                options = "grp:alt_shift_toggle";
              };
            };
          };
          cursor = {
            xcursor-theme = "breeze_cursors";
            xcursor-size = 8;
          };

          window-rule = {
            geometry-corner-radius = 20;
            clip-to-geometry = true;
            background-effect = {
              blur = true;
              xray = false;
            };
          };
          debug = {
            honor-xdg-activation-with-invalid-serial = _: { };
          };

          layer-rules = [
            {
              matches = [ { namespace = "^noctalia-overview*"; } ];
              place-within-backdrop = true;
            }
            {
              matches = [ { namespace = "^noctalia-(background|launcher-overlay|dock)-.*$"; } ];
              place-within-backdrop = true;
              background-effect = {
                xray = false;
              };
            }
          ];

          binds =
            let
              noctalia =
                cmd:
                [
                  # TODO: change to package when wrapped
                  "noctalia-shell"
                  "ipc"
                  "call"
                ]
                ++ (pkgs.lib.splitString " " cmd);
            in
            {
              "Mod+Shift+Slash".show-hotkey-overlay = _: { };
              "Mod+Return".spawn = "kitty"; # TODO: switch to pkg when kitty is wrapped too
              "Mod+Space".spawn = noctalia "launcher toggle";
              "Mod+Period".spawn = noctalia "launcher emoji"; # really necessary btw

              "Mod+O" = _: {
                props.repeat = false;
                content.toggle-overview = _: { };
              };

              "Mod+Q" = _: {
                props.repeat = false;
                content.close-window = _: { };
              };

              "Mod+F".maximize-column = _: { };
              "Mod+Shift+F".fullscreen-window = _: { };
              "Mod+C".center-column = _: { };

              "Mod+Minus".set-column-width = "-10%";
              "Mod+Equal".set-column-width = "+10%";
              "Mod+Shift+Minus".set-window-height = "-10%";
              "Mod+Shift+Equal".set-window-height = "+10%";

              "Mod+Left".focus-column-left = _: { };
              "Mod+Down".focus-window-down = _: { };
              "Mod+Up".focus-window-up = _: { };
              "Mod+Right".focus-column-right = _: { };
              "Mod+H".focus-column-left = _: { };
              "Mod+J".focus-window-down = _: { };
              "Mod+K".focus-window-up = _: { };
              "Mod+L".focus-column-right = _: { };

              "Mod+Ctrl+Left".move-column-left = _: { };
              "Mod+Ctrl+Down".move-window-down = _: { };
              "Mod+Ctrl+Up".move-window-up = _: { };
              "Mod+Ctrl+Right".move-column-right = _: { };
              "Mod+Ctrl+H".move-column-left = _: { };
              "Mod+Ctrl+J".move-window-down = _: { };
              "Mod+Ctrl+K".move-window-up = _: { };
              "Mod+Ctrl+L".move-column-right = _: { };

              "Mod+U".focus-workspace-down = _: { };
              "Mod+I".focus-workspace-up = _: { };
              "Mod+Ctrl+U".move-workspace-down = _: { };
              "Mod+Ctrl+I".move-workspace-up = _: { };

              "Mod+BracketLeft".consume-or-expel-window-left = _: { };
              "Mod+BracketRight".consume-or-expel-window-right = _: { };

              "Mod+V".toggle-window-floating = _: { };
              "Mod+Shift+V".switch-focus-between-floating-and-tiling = _: { };

              "Mod+Shift+E".quit = _: { };

              "Print".screenshot = _: { };
              "XF86AudioMute".spawn = noctalia "volume muteOutput";
              "XF86AudioLowerVolume".spawn = noctalia "volume decrease";
              "XF86AudioRaiseVolume".spawn = noctalia "volume increase";
              "XF86MonBrightnessDown".spawn = noctalia "brightness decrease";
              "XF86MonBrightnessUp".spawn = noctalia "brightness increase";
              "XF86AudioNext".spawn = noctalia "media next";
              "XF86AudioPause".spawn = noctalia "media pause";
              "XF86AudioPlay".spawn = noctalia "media play";
              "XF86AudioPrev".spawn = noctalia "media previous";
            };
          spawn-at-startup = [
            "noctalia-shell"
          ];
        };
      };
    };
}
