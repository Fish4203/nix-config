{
  pkgs,
  lib,
  ...
}: {
  programs.neovim = {
    enable = true;
    
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;

    extraLuaConfig = lib.fileContents ./lua.init;

    plugins = [
      pkgs.vimPlugins.nvim-tree-lua
      {
        plugin = pkgs.vimPlugins.vim-startify;
        config = "let g:startify_change_to_vcs_root = 0";
      }
    ];
}