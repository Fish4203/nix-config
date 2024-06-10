{ 
  pkgs, 
  inputs,
  ...
}: {

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  xdg.portal = {
    enable = true;
    wlr = {
      enable = true;
    };
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];

    config = {
      common = {
        default = [
          "gtk"
        ];
      };
      hyprland = {
        default = [
          "hyprland"
          "gtk"
        ];
      };
    };
  };
}
