{
  pkgs,
  ...
}: {
  # home.file.".config/polybar/colors.ini".source = ./colors.ini; 
  home.file.".config/polybar/custom_modules.ini".source = ./custom_modules.ini; 
  home.file.".config/polybar/modules.ini".source = ./modules.ini; 
  
  services.polybar = {
    enable = true;

    config = import ./config.nix {};
  };
}
