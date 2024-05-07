{ ... }: {
  layer = "top"; # Waybar at top layer
  # "position = "left", # Waybar position (top|bottom|left|right)
  height = 40; # Waybar height (to be removed for auto height)
  #"gtk-layer-shell = false,
  # "width = 1280, # Waybar width
  # Choose the order of the modules
  modules-left = [ "tray" "hyprland/workspaces" ];
  #, "hyprland/mode", "custom/media"],
  # "modules-center = ["custom/spotify"],
  modules-right = [
    "memory"
    "custom/separator"
    "temperature"
    "custom/separator"
    "backlight"
    "custom/separator"
    "battery"
    "custom/separator"
    "pulseaudio"
    "custom/separator"
    "network"
    # "custom/separator"
    # "custom/waylandvsxorg"
    "custom/separator"
    "bluetooth"
    "custom/separator"
    "clock"
    "custom/separator"
  ];

  # Modules configuration
  "hyprland/workspaces" = {
      disable-scroll = true;
      all-outputs = false;
      format = "{name}: {windows}";
      format-icons = {
          "1" = " ";
          "2" = " ";
          "3" = "󰍡 ";
          "11" = "󰈹 ";
          "12" = " ";
          "13" = " ";
          urgent = " ";
          focused = " ";
          default = "name";
      };
      window-rewrite-default = " ";
      window-rewrite = {
        "class<firefox>" = "󰈹 ";
        "codium" = " ";
        "kitty" = " ";
      };
      format-window-separator = "";
  };
  "custom/wmname" = {
      format = "";
      tooltip = false;
      on-scroll-down = "/usr/local/bin/hyprctl dispatch workspace m+1";
      on-scroll-up = "/usr/local/bin/hyprctl dispatch workspace m-1";
  };
  "wlr/workspaces" = {
      sort-by-name = true;
      # on-click = "/usr/local/bin/hyprctl dispatch workspace 3"
      # sort-by-coordinates = true
  };
  "custom/separator" = {
      format = "|";
      interval = "once";
      tooltip = false;
  };
  "idle_inhibitor" = {
      format = "{icon}";
      format-icons = {
          activated = "󰈈";
          deactivated = "󰈉";
      };
  };
  "tray" = {
      icon-size = 30;
      spacing = 6;
      show-passive-items = true;
  };
  "clock" = {
      # timezone = "America/New_York";
      # format = " {time}";
      format = "{:%H:%M %a %Y-%m-%d}";
      tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      format-alt = "{:%H:%M:%S}";
      interval = 1;
  };
  "cpu" = {
      format = "󰻠&#8239;{usage}%";
      tooltip = false;
      on-click = "kitty procs --sortd cpu --watch-interval 2";
  };
  "memory" = {
      interval = 30;
      format = "󰘚&#8239; {used}/{total}";  
  };   
  "temperature" = {
      thermal-zone = 2;
      # hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
      critical-threshold = 80;
      # format-critical = "{temperatureC}°C {icon}";
      format = "{icon}&#8239;{temperatureC}°C";
      format-icons = ["" "" ""];
  };
  "backlight" = {
      device = "acpi_video1";
      format = "{icon}&#8239;{percent}%";
      format-icons = ["󱩏 " "󱩖 "];
  };
  "battery" = {
      states = {
          # good = 95;
          warning = 30;
          critical = 15;
      };
      format = "{icon} &#8239;{capacity}%";
      format-charging = "󱐋&#8239;{capacity}%";
      format-plugged = "󰚥&#8239;{capacity}%";
      format-alt = "{icon} {time}";
      # format-good = ""; # An empty format will hide the module
      # format-full = "";
      format-icons = [" " " " " " " " " "];
  };
  "battery#bat2" = {
      bat = "BAT2";
  };
  "network" = {
      # interface = "wlp2*"; # (Optional) To force the use of this interface
      format-wifi = "󰖩&#8239;{essid} ({signalStrength}%)";
      format-ethernet = "󰛳&#8239;{ipaddr}/{cidr}";
      format-linked = "󰛳&#8239;{ifname} (No IP)";
      format-disconnected = "󰅛&#8239;Disconnected";
      format-alt = "{ifname}: {ipaddr}/{cidr}";
      on-click-right = "nm-connection-editor";
  };
  "bluetooth" = {
      format = "󰂯";
      format-disabled = "󰂲";
      interval = 30;
      on-click = "blueman-manager";
      on-click-right = "rfkill toggle bluetooth";
      tooltip-format = "{}";
  };
  "pulseaudio" = {
      # scroll-step = 1; # %; can be a float
      format = "{icon}&#8239;{volume}% {format_source}";
      format-bluetooth = "{volume}% {icon}󰗾 {format_source}";
      format-bluetooth-muted = "{icon}󰗿 {format_source}";
      format-muted = "󰝟&#8239;0% {format_source}";
      format-source = "&#8239;{volume}%";
      format-source-muted = "";
      format-icons = {
          headphone = "󰋋";
          hands-free = "󰋎";
          headset = "󰋎";
          phone = "";
          portable = "";
          car = "";
          default = ["󰕿" "󰖀" "󰕾"];
      };
      on-click = "pavucontrol";
  };
  "custom/spotify" = {
      exec = "/usr/bin/python3 /home/frigaut/bin/mediaplayer.py --player spotify";
      format = "{}  ";
      return-type = "json";
      on-click = "playerctl play-pause";
      on-scroll-up = "playerctl next";
      on-scroll-down = "playerctl previous";
  };
  "custom/media" = {
      format = "{icon} {}";
      return-type = "json";
      max-length = 40;
      format-icons = {
          spotify = "";
          default = "🎜";
      };
      escape = true;
      exec = "$HOME/.config/waybar/mediaplayer.py 2> /dev/null"; # Script in resources folder
  };
}
