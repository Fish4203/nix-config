{ 
  config, 
  pkgs, 
  ... 
}: { 
  services.xserver = {
    enable = true;

  
    displayManager = {
        sddm.enable = true;
        defaultSession = "none+awesome";
    };

    windowManager.awesome = {
      enable = true;
    };
  };
}

