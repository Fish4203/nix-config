{
  pkgs,
  ...
}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    theme = ./drac.rasi;

    terminal = "${pkgs.kitty}/bin/kitty";

    pass = {
      enable = true;
      package = pkgs.rofi-pass-wayland;
    };
  };
}