{ pkgs, ... }:

let
  modifier = "Mod4";
  fileManager = "kitty --title ranger -e ranger";
  menu = "wmenu-run";
  terminal = "kitty";
  resizeAmount = "10";
in
{
  home.packages = with pkgs; [
    # application dependencies
    kitty
    wmenu
    ranger

    # keybind dependencies
    pulseaudio
    playerctl
    brightnessctl
  ];

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

        # Audio binds
        "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
        "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";

        # Brightness binds
        "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
        "XF86MonBrightnessUp" = "exec brightnessctl set 5%+";

        # Player
        "XF86AudioNext" = "exec playerctl next";
        "XF86AudioPause" = "exec playerctl play-pause";
        "XF86AudioPlay" = "exec playerctl play-pause";
        "XF86AudioPrev" = "exec playerctl previous";
      };

      modes = { };
    };
  };
}
