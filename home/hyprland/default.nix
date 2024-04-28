{ 
  inputs,
  pkgs, 
  config, 
  split-monitor-workspaces,
  hyprland-plugins,
  ... 
}: {
  home.file.".config/hypr/hyprpaper.conf".source = ./hyprpaper.conf; 
  home.file.".config/hypr/wallpaper.png".source = ./wallpaper.png; 

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;

    settings = import ./config.nix {};

    extraConfig =  ''
      plugin {
        hyprexpo {
            columns = 3
            gap_size = 5
            bg_col = rgb(111111)
            workspace_method = center current # [center/first] [workspace] e.g. first 1 or center m+1

            enable_gesture = true  # laptop touchpad, 4 fingers
            gesture_distance = 300  # how far is the "max"
            gesture_positive = true  # positive = swipe down. Negative = swipe up.
        };
        split-monitor-workspaces {
            count = 10
        }
      }
    '';

    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
      split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
    ];
  };

}
