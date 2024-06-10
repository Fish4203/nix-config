{
  pkgs,
  ...
}: {
  home.file.".config/awesome".source = ./awesome; 
  #home.file.".local/share/fonts/".source = ./awesome;
  #home.file.".config/awesome".source = ./awesome;
  #home.file.".config/awesome".source = ./awesome;

  xsession.windowManager.awesome = {
    enable = true;
  };

  home.packages = with pkgs; [
    networkmanagerapplet
    NetworkManager
    light
    acpi
    playerctl
    scrot
    picom
    alsa-utils
    nitrogen
    lxappearance
  ];

}
