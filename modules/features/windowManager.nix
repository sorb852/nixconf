{ self, ... }:

{
  flake.homeModules.windowManager =
    { pkgs, lib, ... }:
    let
      p_kitty = lib.getExe pkgs.kitty;
      p_ranger = lib.getExe pkgs.ranger;
      p_wmenu_run = lib.getExe' pkgs.wmenu "wmenu-run";

      p_pactl = lib.getExe' pkgs.pulseaudio "pactl";
      p_brightnessctl = lib.getExe pkgs.brightnessctl;
      p_playerctl = lib.getExe pkgs.playerctl;

      p_awww = lib.getExe' pkgs.awww "awww";
      p_awww_daemon = lib.getExe' pkgs.awww "awww-daemon";
      p_grim = lib.getExe pkgs.grim;
      p_slurp = lib.getExe pkgs.slurp;
      p_wlcopy = lib.getExe' pkgs.wl-clipboard "wl-copy";
      p_hyprlock = lib.getExe pkgs.hyprlock;

      fileManager = "${p_kitty} --title ranger -e ${p_ranger}";
      menu = "${p_wmenu_run}";
      terminal = "${p_kitty}";

      hyprcol = col: "rgb(${builtins.substring 1 6 col})";
    in
    {
      wayland.windowManager.hyprland = {
        enable = true;
        settings = {
          monitor = ",preferred,auto,1";
          ecosystem.enforce_permissions = false;
          misc = {
            disable_hyprland_logo = false; # cant get called a wait fuck im ricing i am a redditor
            disable_splash_rendering = false; # cant get called a wait fuck im ricing i am a redditor
            background_color = "${hyprcol self.theme.shade0}";
            font_family = "Anka/Coder Condensed";
          };

          exec-once = [
            "${p_awww_daemon}"
            "${p_awww} img ${./wallpapers/makeshiftwallpaper.png}"
          ];

          env = [
            "XCURSOR_SIZE,12"
            "HYPRCURSOR_SIZE,12"
          ];

          general = {
            border_size = 1;
            "col.inactive_border" = "${hyprcol self.theme.shade1}";
            "col.active_border" = "${hyprcol self.theme.shade3}";
          };

          bezier = [
            "overshoot, 0.019, 0.747, 0.018, 0.98"
          ];
          animation = [
            "workspaces, 1, 2, overshoot"
          ];

          windowrule = [
            "match:class kitty, float on"
            "match:class kitty, center on"
            "match:class kitty, size (monitor_w*0.5) (monitor_h*0.5)"

            "match:class org.pulseaudio.pavucontrol, float on"
            "match:class org.pulseaudio.pavucontrol, center on"
            "match:class org.pulseaudio.pavucontrol, size (monitor_w*0.5) (monitor_h*0.5)"

            "match:title Friends List, float on"
            "match:title Steam - Update News, float on"
            "match:title Picture-in-Picture, float on"
          ];

          input = {
            kb_layout = "us,mn";
            kb_options = "grp:alt_shift_toggle";
          };

          bind = [
            # Spawn
            "SUPER, return, exec, ${terminal}"
            "SUPER, space, exec, ${menu}"
            "SUPER, e, exec, ${fileManager}"

            # Window properties
            "ALT, F4, killactive,"
            "SUPER, v, togglefloating,"
            "SUPER, f, fullscreen,"

            # Window related
            "SUPER, h, movefocus, l"
            "SUPER, j, movefocus, u"
            "SUPER, k, movefocus, d"
            "SUPER, l, movefocus, r"
            "SUPER ALT, h, movewindow, l"
            "SUPER ALT, j, movewindow, u"
            "SUPER ALT, k, movewindow, d"
            "SUPER ALT, l, movewindow, r"
            "SUPER SHIFT, h, resizeactive, -20    0"
            "SUPER SHIFT, j, resizeactive,   0  -20"
            "SUPER SHIFT, k, resizeactive,   0   20"
            "SUPER SHIFT, l, resizeactive,  20    0"

            # Workspace related
            "SUPER, 1, workspace, 1"
            "SUPER, 2, workspace, 2"
            "SUPER, 3, workspace, 3"
            "SUPER, 4, workspace, 4"
            "SUPER, 5, workspace, 5"
            "SUPER, 6, workspace, 6"
            "SUPER, 7, workspace, 7"
            "SUPER, 8, workspace, 8"
            "SUPER, 9, workspace, 9"
            "SUPER SHIFT, 1, movetoworkspace, 1"
            "SUPER SHIFT, 2, movetoworkspace, 2"
            "SUPER SHIFT, 3, movetoworkspace, 3"
            "SUPER SHIFT, 4, movetoworkspace, 4"
            "SUPER SHIFT, 5, movetoworkspace, 5"
            "SUPER SHIFT, 6, movetoworkspace, 6"
            "SUPER SHIFT, 7, movetoworkspace, 7"
            "SUPER SHIFT, 8, movetoworkspace, 8"
            "SUPER SHIFT, 9, movetoworkspace, 9"

            # Screenshotting
            ", Print, exec, grim ~/Pictures/$(date +'%Y-%m-%d-%H%M%S').png"
            "Shift, Print, exec, ${p_grim} -g $(${p_slurp}) - | ${p_wlcopy}"

            # Audio binds
            ", XF86AudioMute, exec, ${p_pactl} set-sink-mute @DEFAULT_SINK@ toggle"
            ", XF86AudioLowerVolume, exec, ${p_pactl} set-sink-volume @DEFAULT_SINK@ -5%"
            ", XF86AudioRaiseVolume, exec, ${p_pactl} set-sink-volume @DEFAULT_SINK@ +5%"

            # Brightness binds
            ", XF86MonBrightnessDown, exec, ${p_brightnessctl} set 5%-"
            ", xF86MonBrightnessUp, exec, ${p_brightnessctl} set 5%+"

            # Player
            ", XF86AudioNext, exec, ${p_playerctl} next"
            ", XF86AudioPause, exec, ${p_playerctl} play-pause"
            ", XF86AudioPlay, exec, ${p_playerctl} play-pause"
            ", XF86AudioPrev, exec, ${p_playerctl} previous"

            # Hypr related
            "SUPER, m, exit"
            "SUPER, r, exec, hyprctl reload"
          ];
          # Mouse binds
          bindm = [
            # Moving and resizing
            "SUPER, mouse:272, movewindow"
            "SUPER, mouse:273, resizewindow"
          ];
          # Lid off screen toggle
          bindl = [
            ", switch:on:Lid Switch, exec, hyprctl keyword monitor \"e-DP-1, disable\""
            ", switch:off:Lid Switch, exec, hyprctl keyword monitor \"e-DP-1, enable\""
          ];
        };
      };

      services.hypridle = {
        enable = true;

        settings = {
          listener = [
            {
              timeout = 240; # 4 min
              on-timeout = "${p_brightnessctl} -s set 10%";
              on-resume = "${p_brightnessctl} -r";
            }
            {
              timeout = 300; # 5 min
              on-timeout = "hyprctl keyword monitor \"eDP-1, disable\" && ${p_hyprlock}";
              on-resume = "hyprctl keyword monitor \"eDP-1, enable\"";
            }
          ];
        };
      };
    };
}
