{
  pkgs,
  config,
  ...
}: {
  programs = {
    chromium = {
      enable = true;
      commandLineArgs = ["--enable-features=TouchpadOverscrollHistoryNavigation"];
      extensions = [
        # {id = "";}  // extension id, query from chrome web store
      ];
    };

    firefox = {
      enable = true;
      profiles.fish4203 = {};
    };
  };

  # home.persistence."/nix/dotfiles" = {
  #     removePrefixDirectory = true;   # for GNU Stow styled dotfile folders
  #     allowOther = true;
  #     directories = [
  #       # fuse mounted from /nix/dotfiles/Firefox/.mozilla to /home/$USERNAME/.mozilla
  #       "Firefox/.mozilla"
  #     ];
  #   };
}