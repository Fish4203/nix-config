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
    bashrcExtra = ''
      source ${./git-prompt.sh}
      PS1_CMD1=$(__git_ps1 " (%s)")
      PS1="\u@\H:\w\[\e[2m\]''${PS1_CMD1}\[\e[0m\] > "
    '';
  };
  
}