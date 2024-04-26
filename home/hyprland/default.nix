{ 
  pkgs, 
  config, 
  ... 
}: {
  home.file.".config/hypr/hyprland.config".source = ./hyprland.conf; 
}
