{ 
  pkgs, 
  ... 
}: {
  home.file.".config/i3/config".source = ./config; 
  home.file.".config/i3/config.base".source = ./config.base; 

  xsession.windowManager.i3 = {
    enable = true;
    package = pkg.i3-rounded;

  };
}
