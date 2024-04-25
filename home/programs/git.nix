{
  pkgs,
  ...
}: {
  home.packages = [pkgs.gh];

  programs.git = {
    enable = true;

    userName = "benRyc";
    userEmail = "fishs4203@gmail.com";
  };
}