{ 
  pkgs, 
  inputs,
  ...
}: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    package = pkgs.waybar;

    settings = {
      "layer": "top", # Waybar at top layer
      # "position": "left", # Waybar position (top|bottom|left|right)
      "height": 40, # Waybar height (to be removed for auto height)
      #"gtk-layer-shell": false,
      # "width": 1280, # Waybar width
      # Choose the order of the modules
      "modules-left": ["tray", "wlr/workspaces"],
      #, "sway/mode", "custom/media"],
      # "modules-center": ["custom/spotify"],
      "modules-right": [
          "cpu",
          "custom/separator",
          "temperature",
          #"custom/separator",
          #"custom/power",
          "custom/separator",
          "backlight",
          "custom/separator",
          "battery",
          "custom/separator",
          "pulseaudio",
          "custom/separator",
          "network",
          # "custom/separator",
          # "custom/waylandvsxorg",
          "custom/separator",
          "bluetooth",
          "custom/separator",
          "clock",
          "custom/separator",
          ],
          # "custom/language",
          # "custom/separator",
      # Modules configuration
      "sway/workspaces": {
          "disable-scroll": true,
          "all-outputs": true,
          "format": "{name}: {icon}",
          "format-icons": {
              "1": "",
              "2": "",
              "3": "",
              "4": "",
              "5": "",
              "urgent": "",
              "focused": "",
              "default": ""
          }
      },
      "custom/wmname": {
          "format": "",
          "tooltip": false,
          "on-scroll-down": "/usr/local/bin/hyprctl dispatch workspace m+1",
          "on-scroll-up": "/usr/local/bin/hyprctl dispatch workspace m-1"
      },
      "wlr/workspaces": {
          "sort-by-name": true
          # "on-click": "/usr/local/bin/hyprctl dispatch workspace 3"
          # "sort-by-coordinates": true
      },
      "custom/language": {
          "exec": "swaymsg --type get_inputs | grep \"xkb_active_layout_name\" | sed -u '1!d; s/^.*xkb_active_layout_name\": \"//; s/ (US)//; s/\",//' && swaymsg --type subscribe --monitor '[\"input\"]' | sed -u 's/^.*xkb_active_layout_name\": \"//; s/\",.*$//; s/ (US)//'"
      },
      "custom/separator": {
          "format": "|",
          "interval": "once",
          "tooltip": false
      },
      "sway/mode": {
          "format": "<span style=\"italic\">{}</span>"
      },
      "idle_inhibitor": {
          "format": "{icon}",
          "format-icons": {
              "activated": "",
              "deactivated": ""
          }
      },
      "tray": {
          "icon-size": 30,
          "spacing": 6,
          "show-passive-items": true
      },
      "clock": {
          # "timezone": "America/New_York",
          # "format": " {time}",
          "format": "{:%H:%M %a %Y-%m-%d}",
          "tooltip-format": "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>",
          "format-alt": "{:%H:%M:%S}",
          "interval": 1
      },
      "cpu": {
          "format": "&#8239;{usage}%",
          "tooltip": false,
          "on-click": "kitty procs --sortd cpu --watch-interval 2"
      },
      "memory": {
          "format": " {}%"
      },
      "temperature": {
          # "thermal-zone": 2,
          # "hwmon-path": "/sys/class/hwmon/hwmon2/temp1_input",
          "critical-threshold": 80,
          # "format-critical": "{temperatureC}°C {icon}",
          "format": "{icon}&#8239;{temperatureC}°C",
          "format-icons": ["", "", ""]
      },
      "backlight": {
          # "device": "acpi_video1",
          "format": "{icon}&#8239;{percent}%",
          "format-icons": ["", ""]
      },
      "battery": {
          "states": {
              # "good": 95,
              "warning": 30,
              "critical": 15
          },
          "format": "{icon}&#8239;{capacity}%",
          "format-charging": "&#8239;{capacity}%",
          "format-plugged": "&#8239;{capacity}%",
          "format-alt": "{icon} {time}",
          # "format-good": "", # An empty format will hide the module
          # "format-full": "",
          #"format-icons": ["", "", "", "", ""]
          "format-icons": ["", "", "", "", ""]
      },
      "battery#bat2": {
          "bat": "BAT2"
      },
      "network": {
          # "interface": "wlp2*", # (Optional) To force the use of this interface
          "format-wifi": "&#8239;{essid} ({signalStrength}%)",
          "format-ethernet": "&#8239;{ifname}: {ipaddr}/{cidr}",
          "format-linked": "&#8239;{ifname} (No IP)",
          "format-disconnected": "&#8239;Disconnected",
          "format-alt": "{ifname}: {ipaddr}/{cidr}",
          "on-click-right": "nm-connection-editor"
      },
      "bluetooth": {
          "format": "",
          "format-disabled": "",
          "interval": 30,
          "on-click": "blueman-manager",
          "on-click-right": "rfkill toggle bluetooth",
          "tooltip-format": "{}"
      },
      "pulseaudio": {
          # "scroll-step": 1, # %, can be a float
          "format": "{icon}&#8239;{volume}% {format_source}",
          "format-bluetooth": "{volume}% {icon} {format_source}",
          "format-bluetooth-muted": " {icon} {format_source}",
          "format-muted": "&#8239;0% {format_source}",
          "format-source": "&#8239;{volume}%",
          "format-source-muted": "",
          "format-icons": {
              "headphone": "",
              "hands-free": "",
              "headset": "",
              "phone": "",
              "portable": "",
              "car": "",
              "default": ["", "", ""]
          },
          "on-click": "pavucontrol"
      },
      "custom/power": {
          "format": "&#8239;{}W",
          "exec": "$HOME/bin/power.sh",
          "interval": 2
      },
      "custom/waylandvsxorg": {
          "exec": "$HOME/bin/window_wayland_xorg.sh",
          "interval": 2
      },
      "custom/pacman": {
          "format": "pkgs:{}",
          "exec": "$HOME/bin/updates-pacman-aurhelper.sh",
          "interval": 600,
          "on-click": "kitty paru -Syu --noconfirm --ignore=linux*"
      },
      "custom/spotify": {
          "exec": "/usr/bin/python3 /home/frigaut/bin/mediaplayer.py --player spotify",
          "format": "{}  ",
          "return-type": "json",
          "on-click": "playerctl play-pause",
          "on-scroll-up": "playerctl next",
          "on-scroll-down": "playerctl previous"
      },
      "custom/media": {
          "format": "{icon} {}",
          "return-type": "json",
          "max-length": 40,
          "format-icons": {
              "spotify": "",
              "default": "🎜"
          },
          "escape": true,
          "exec": "$HOME/.config/waybar/mediaplayer.py 2> /dev/null" # Script in resources folder
      }
    };

    style = ''
      @define-color critical #ff0000; /* critical color */
      @define-color warning #f3f809;  /* warning color */
      @define-color fgcolor #ffffff;  /* foreground color */
      @define-color bgcolor #182225;  /* background color */
      @define-color bgcolor #182225;  /* background color */
      @define-color alert   #df3320;

      /* ROSE PINE */
      /* @define-color accent1 #eb6f92;
      @define-color accent2 #9ccfd8;
      @define-color accent3 #f6c177;
      @define-color accent4 #31748f;
      @define-color accent5 #c4a7e7;
      @define-color accent6 #ebbcba; */

      /* DRACULA */
      /* @define-color accent1 #ff5555;
      @define-color accent2 #50fa7b;
      @define-color accent3 #f1fa8c;
      @define-color accent4 #bd93f9;
      @define-color accent5 #ff79c6;
      @define-color accent6 #8be9fd; */

      /* MONOKAI PRO */
      /* @define-color accent1 #ff6188;
      @define-color accent2 #a9dc76;
      @define-color accent3 #ffd866;
      @define-color accent4 #fc9867;
      @define-color accent5 #ab9df2;
      @define-color accent6 #78dce8; */

      /* TOKYO NIGHT */
      /* @define-color accent1 #ff7a93;
      @define-color accent2 #b9f27c;
      @define-color accent3 #ff9e64;
      @define-color accent4 #bb9af7;
      @define-color accent5 #7da6ff;
      @define-color accent6 #0db9d7; */

      /* Ben 1 */
      @define-color accent1 #BE0E18;
      @define-color accent2 #DD6418;
      @define-color accent3 #DD6418;
      @define-color accent4 #DF8A32;
      @define-color accent5 #F6B821;
      @define-color accent6 #F6B821;


      * {
          border: none;
          border-radius: 6px;
          /* `otf-font-awesome` is required to be installed for icons */
          font-family: "JetBrainsMono Bold", "Roboto Mono Medium", Helvetica, Arial, sans-serif;
          /* Recommended font sizes: 720p: ~14px, 1080p: ~18px */
          font-size: 22px;
          min-height: 0;
      }

      /* icons start at U+E900 in Jetbrains mono in gucharmap */

      window#waybar {
          background-color: rgba(50, 50, 50, 0.9);
          background-color: @bgcolor;
          /* border-bottom: 0px solid rgba(100, 114, 125, 0.5); */
          color: #ffffff;
          transition-property: background-color;
          transition-duration: .5s;
          border-radius: 0;
      }

      window#waybar.hidden {
          opacity: 0.2;
      }

      /*
      window#waybar.empty {
          background-color: transparent;
      }
      window#waybar.solo {
          background-color: #FFFFFF;
      }
      */

      window#waybar.termite {
          background-color: #3F3F3F;
      }

      window#waybar.chromium {
          background-color: #000000;
          border: none;
      }

      #workspaces button {
          padding: 0 0 0 0;
          margin: 4px 0 6px 0;
          background-color: transparent;
          color: #ffffff;
          min-width: 36px;
          /* Use box-shadow instead of border so the text isn't offset */
      /*    box-shadow: inset 0 -3px transparent;*/
          /* border-radius: 0px; */
      }

      #workspaces button.active {
          padding: 0 0 0 0;
          margin: 4px 0 6px 0;
          background-color: @accent2;
          color: #000000;
          min-width: 36px;
          /* Use box-shadow instead of border so the text isn't offset */
      /*    box-shadow: inset 0 -3px transparent;*/
          /* border-radius: 0px; */
      }

      /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
      #workspaces button:hover {
          background: rgba(0, 0, 0, 0.2);
          /* box-shadow: inset 0 -3px #ffffff; */
      }

      #workspaces button.focused {
          background-color: #bbccdd;
          color: #323232;
          /* box-shadow: inset 0 -3px #ffffff; */
      }

      #workspaces button.urgent {
          background-color: #eb4d4b;
      }

      #mode {
          background-color: #64727D;
          border-bottom: 3px solid #ffffff;
      }

      #clock,
      #battery,
      #cpu,
      #memory,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #custom-media,
      #tray,
      #mode,
      #idle_inhibitor,
      #custom-power,
      #custom-pacman,
      #mpd,
      #language {
          padding: 1px 6px 0px 6px;
          margin: 4px 3px 5px 3px;
          color: @fgcolor;
          /* background-color: #bbccdd; */
          background-color:transparent;
      }

      #window,
      #workspaces {
          margin: 0 4px;
      }

      /* If workspaces is the leftmost module, omit left margin */
      .modules-left > widget:first-child > #workspaces {
          margin-left: 0;
      }

      /* If workspaces is the rightmost module, omit right margin */
      .modules-right > widget:last-child > #workspaces {
          margin-right: 0;
      }

      #clock {
      }

      #battery {
          color: @accent2;
      }

      /* #battery.charging {
          color: #ffffff;
          background-color: #26A65B;
      } */

      @keyframes blink {
          to {
              background-color: #ffffff;
              color: #333333;
          }
      }

      #battery.critical:not(.charging) {
      /*    color: @critical;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
      */    background-color: @critical;
          color: @white;
      }

      label:focus {
          background-color: #000000;
      }

      #cpu {
          color: @accent1;
      }

      #memory {
          background-color: #9b59b6;
      }

      #backlight {
          color: @accent2;
      }

      #network {
          color: @accent5;
      }

      #network.disconnected {
          color: @alert;
      }

      #bluetooth {
          color: @accent5;
      }

      #pulseaudio {
          color: @accent4;
      }

      #pulseaudio.muted {
          color: #a0a0a0;
      }

      #custom-power {
          color: @accent6;
      }

      #custom-waylandvsxorg {
          color: @accent5;
      }

      #tooth {
          color: @accent2;
      }

      #custom-media {
          background-color: #66cc99;
          color: #2a5c45;
          min-width: 100px;
      }

      #custom-media.custom-spotify {
          background-color: #66cc99;
      }

      #custom-media.custom-vlc {
          background-color: #ffa000;
      }

      #temperature {
          color: @accent1;
          /* background-color: #f0932b; */
      }

      #temperature.critical {
          background-color: @critical;
      }

      #tray {
          /* background-color: #505050; */
      }

      #idle_inhibitor {
          background-color: #2d3436;
      }

      #idle_inhibitor.activated {
          background-color: #ecf0f1;
          color: #2d3436;
      }

      #mpd {
          background-color: #66cc99;
          color: #2a5c45;
      }

      #mpd.disconnected {
          background-color: #f53c3c;
      }

      #mpd.stopped {
          background-color: #90b1b1;
      }

      #mpd.paused {
          background-color: #51a37a;
      }

      #custom-language {
          /* background: #bbccdd;
          color: #333333;
          padding: 0 5px;
          margin: 4px 3px 6px 3px; */
          color: @accent5;
          min-width: 16px;
      }

      #custom-separator {
          color: #606060;
          margin: 0 1px;
          padding-bottom: 5px;
      }

      .custom-spotify {
          padding: 0 10px;
          margin: 4px 4px;
          background-color: rgba(56,220,114,0.4);
          color: black;
      }

      #custom-wmname {
          padding: 0 0 0 0;
          margin: 4px 0 6px 0;
          min-width: 36px;
          font-size: 22px;
      }

    '';

  };
  
}