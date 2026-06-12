{ inputs, self, ... }:

{
  perSystem =
    { lib, pkgs, ... }:
    let
      p_awww = lib.getExe' pkgs.awww "awww";
      p_awww_daemon = lib.getExe' pkgs.awww "awww-daemon";
      p_qs = lib.getExe pkgs.quickshell; # TODO: switch to pkg when wrapped
      p_playerctl = lib.getExe pkgs.playerctl;
    in
    {
      packages.niri = inputs.wrappers.wrappers.niri.wrap {
        inherit pkgs;
        runtimePkgs = [ pkgs.xwayland-satellite ];
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
          overview = {
            backdrop-color = "${self.theme.shade0}";
          };
          binds = {
            "Mod+Shift+Slash".show-hotkey-overlay = _: { };
            "Mod+Return".spawn = "kitty"; # TODO: switch to pkg when kitty is wrapped too
            "Mod+Space".spawn = [
              "${p_qs}"
              "ipc"
              "call"
              "launcher"
              "toggle"
            ];

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

            "Print".spawn = [
              "${p_qs}"
              "ipc"
              "call"
              "screenshot"
              "take"
            ];

            "XF86AudioMute".spawn = [
              "${p_qs}"
              "ipc"
              "call"
              "audio"
              "toggle"
            ];
            "XF86AudioLowerVolume".spawn = [
              "${p_qs}"
              "ipc"
              "call"
              "audio"
              "dec"
              "5"
            ];
            "XF86AudioRaiseVolume".spawn = [
              "${p_qs}"
              "ipc"
              "call"
              "audio"
              "inc"
              "5"
            ];

            "XF86MonBrightnessDown".spawn = [
              "${p_qs}"
              "ipc"
              "call"
              "brightness"
              "dec"
              "5"
            ];
            "XF86MonBrightnessUp".spawn = [
              "${p_qs}"
              "ipc"
              "call"
              "brightness"
              "inc"
              "5"
            ];

            "XF86AudioNext".spawn = [
              "${p_playerctl}"
              "next"
            ];
            "XF86AudioPause".spawn = [
              "${p_playerctl}"
              "play-pause"
            ];
            "XF86AudioPlay".spawn = [
              "${p_playerctl}"
              "play-pause"
            ];
            "XF86AudioPrev".spawn = [
              "${p_playerctl}"
              "previous"
            ];
          };
          spawn-at-startup = [
            "${p_awww_daemon}"
            [
              "${p_awww}"
              "img"
              "${./assets/makeshiftwallpaper.png}"
            ]
            "${p_qs}" # Just trust the process for a bit, I mean this is my config so it should get just as dirty as me
          ];
        };
      };
    };
}
