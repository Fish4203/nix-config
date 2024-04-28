{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    kitty
    lazygit
  ];

  home.file.".config/kitty/kitty.conf".source = ./kitty.conf; 

  # environment.etc."inputrc".source = ./inputrc;

  programs.readline = {
    enable = true;

    extraConfig = ''
      # Respect default shortcuts.
      $include /etc/inputrc

      ## arrow up
      "\e[A":history-search-backward
      ## arrow down
      "\e[B":history-search-forward
    '';
  };

  programs.bash = {
    enable = true;
    # bashrcExtra = ''
    
    # '';
  };
  
}