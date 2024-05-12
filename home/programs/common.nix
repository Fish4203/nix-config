{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    p7zip

    ripgrep
    lxde.lxsession

    # misc
    xdg-utils
    graphviz

    # IDE
    insomnia
    vscodium

    # security 
  ];

  programs = {
    btop = {
      enable = true;
      settings = {
        color_theme = "onedark";
      };
    }; # replacement of htop/nmon
    jq.enable = true; # A lightweight and flexible command-line JSON processor
    ssh.enable = true;

    skim = {
      enable = true;
      enableZshIntegration = true;
      defaultCommand = "rg --files --hidden";
      changeDirWidgetOptions = [
        "--preview 'exa --icons --git --color always -T -L 3 {} | head -200'"
        "--exact"
      ];
    };
  };

  services = {
    # syncthing.enable = true;

    # auto mount usb drives
    udiskie.enable = true;
  };
}
