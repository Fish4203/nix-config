{ 
  inputs,
  pkgs, 
  config, 
  split-monitor-workspaces,
  hyprland-plugins,
  hyprland,
  ... 
}: {
  home.file.".config/hypr/hyprpaper.conf".source = ./hyprpaper.conf; 
  home.file.".config/hypr/wallpaper.png".source = ./wallpaper.png; 

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    plugins = [
      hyprland-plugins.packages.${pkgs.system}.hyprexpo
      split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
    ];

    settings = import ./config.nix {};

    extraConfig =  ''
      plugin {
        
        split-monitor-workspaces {
            count = 10
        }
      }
    '';

    package = hyprland.packages.${pkgs.system}.hyprland;

  };

}
