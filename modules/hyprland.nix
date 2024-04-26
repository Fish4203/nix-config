{ 
  pkgs, 
  ...
}: {

  programs.hyprland.enable = true;
  # hyprland related options

  wayland.windowManager.hyprland = {
    enable = true;

    extraPackages = with pkgs; [
      waybar
      hyprpaper
    ];
  };
  
}