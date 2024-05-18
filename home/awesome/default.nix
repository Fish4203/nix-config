{
  pkgs,
  ...
}: {
  home.file.".config/awesome/rc.lua".source = ./rc.lua; 
  
  xsession.windowManager.awesome = {
    enable = true;
  };
}
