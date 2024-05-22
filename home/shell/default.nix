{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    ranger
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
      color_prompt=yes

      source ${./git-prompt.sh}
      PS1="\[\e[93m\]\u@\H:\[\e[32m\]\w\[\e[91m\]''$(__git_ps1)\[\e[0m\] > "
    '';
  };
  
}
