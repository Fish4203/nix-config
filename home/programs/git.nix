{
  pkgs,
  ...
}: {
  home.packages = [pkgs.gh];

  programs.git = {
    enable = true;
    
    extraConfig = {
      pull.rebase = false;
    };

    userName = "benRyc";
    userEmail = "fishs4203@gmail.com";
  };
}
