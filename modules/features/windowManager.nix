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

      modifier = "Mod4";
      fileManager = "${p_kitty} --title ranger -e ${p_ranger}";
      menu = "${p_wmenu_run}";
      terminal = "${p_kitty}";
      resizeAmount = "10";
    in
    {
      wayland.windowManager.sway = {
        enable = true;
        config = {
          fonts = {
            names = [ "Anka/Coder Condensed" ];
            size = 11.0;
          };
          floating = {
            criteria = [
              { class = "Pavucontrol"; }
              { title = "Friends List"; }
              { title = "Steam - Update News"; }
            ];
          };
          window = {
            titlebar = false;
          };

          inherit menu;
          inherit modifier;
          inherit terminal;

          startup = [
            {
              command = "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway";
            }
          ];
          keybindings = {
            "${modifier}+r" = "reload";
            "${modifier}+m" =
              "exec swaynag -t warning -m 'What do you want to do?' -b 'Poweroff' 'systemctl poweroff' -b 'Reboot' 'systemctl reboot'";

            # Window state and some exec binds
            "${modifier}+e" = "exec ${fileManager}";
            "${modifier}+v" = "floating toggle";
            "${modifier}+Return" = "exec ${terminal}";
            "${modifier}+space" = "exec ${menu}";
            "Mod1+F4" = "kill";
            "F11" = "fullscreen toggle";

            # Window movement
            "${modifier}+h" = "focus left";
            "${modifier}+l" = "focus right";
            "${modifier}+k" = "focus up";
            "${modifier}+j" = "focus down";
            "${modifier}+Mod1+h" = "move left";
            "${modifier}+Mod1+l" = "move right";
            "${modifier}+Mod1+k" = "move up";
            "${modifier}+Mod1+j" = "move down";
            "${modifier}+Shift+h" = "resize grow left ${resizeAmount} px";
            "${modifier}+Shift+l" = "resize grow right ${resizeAmount} px";
            "${modifier}+Shift+k" = "resize grow up ${resizeAmount} px";
            "${modifier}+Shift+j" = "resize grow down ${resizeAmount} px";

            # Gotta love me some python
            # Workspace related
            "${modifier}+1" = "workspace 1";
            "${modifier}+2" = "workspace 2";
            "${modifier}+3" = "workspace 3";
            "${modifier}+4" = "workspace 4";
            "${modifier}+5" = "workspace 5";
            "${modifier}+6" = "workspace 6";
            "${modifier}+7" = "workspace 7";
            "${modifier}+8" = "workspace 8";
            "${modifier}+9" = "workspace 9";
            # So basically move them and then move yourself
            "${modifier}+Shift+1" = "move container to workspace 1; workspace 1";
            "${modifier}+Shift+2" = "move container to workspace 2; workspace 2";
            "${modifier}+Shift+3" = "move container to workspace 3; workspace 3";
            "${modifier}+Shift+4" = "move container to workspace 4; workspace 4";
            "${modifier}+Shift+5" = "move container to workspace 5; workspace 5";
            "${modifier}+Shift+6" = "move container to workspace 6; workspace 6";
            "${modifier}+Shift+7" = "move container to workspace 7; workspace 7";
            "${modifier}+Shift+8" = "move container to workspace 8; workspace 8";
            "${modifier}+Shift+9" = "move container to workspace 9; workspace 9";

            ## fun fact: this vimjoyer dude is so fucking goated
            ## this config is at a usable state because of this guy

            # Audio binds
            "XF86AudioMute" = "exec ${p_pactl} set-sink-mute @DEFAULT_SINK@ toggle";
            "XF86AudioLowerVolume" = "exec ${p_pactl} set-sink-volume @DEFAULT_SINK@ -5%";
            "XF86AudioRaiseVolume" = "exec ${p_pactl} set-sink-volume @DEFAULT_SINK@ +5%";

            # Brightness binds
            "XF86MonBrightnessDown" = "exec ${p_brightnessctl} set 5%-";
            "XF86MonBrightnessUp" = "exec ${p_brightnessctl} set 5%+";

            # Player
            "XF86AudioNext" = "exec ${p_playerctl} next";
            "XF86AudioPause" = "exec ${p_playerctl} play-pause";
            "XF86AudioPlay" = "exec ${p_playerctl} play-pause";
            "XF86AudioPrev" = "exec ${p_playerctl} previous";
          };

          modes = { };
        };
      };
    };
}
