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
      mainBar = import ./config.nix;
    };

    style = ./style.css;

  };
  
}