{ 
  pkgs,
  lib,
  ... 
}: {
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-rounded;

    config = rec {
      modifier = "Mod4";
      bars = [ ];

      window.border = 0;

      gaps = {
        inner = 15;
        outer = 5;
      };

      keybindings = lib.mkOptionDefault {
        "XF86AudioMute" = "exec amixer set Master toggle";
        "XF86AudioLowerVolume" = "exec amixer set Master 4%-";
        "XF86AudioRaiseVolume" = "exec amixer set Master 4%+";
        "XF86MonBrightnessDown" = "exec brightnessctl set 4%-";
        "XF86MonBrightnessUp" = "exec brightnessctl set 4%+";
        "${modifier}+Return" = "exec ${pkgs.kitty}/bin/alacritty";
        "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -show combi -combi-modes 'window,drun,ssh' -modes combi";
        "${modifier}+Shift+x" = "exec systemctl suspend";
        "${modifier}+e" = "exec nemo";
      };

      startup = [
        {
          command = "exec i3-msg workspace 1";
          always = true;
          notification = false;
        }
        {
          command = "systemctl --user restart polybar.service";
          always = true;
          notification = false;
        }
        #{
         # command = "${pkgs.feh}/bin/feh --bg-scale ~/background.png";
         # always = true;
         # notification = false;
        #}
      ];
    };

  };
}
