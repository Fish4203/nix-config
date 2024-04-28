{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    kitty
    lazygit
  ];

  home.file.".config/kitty/kitty.conf".source = ./kitty.conf; 

  environment.etc."inputrc".source = ./inputrc;
  
}