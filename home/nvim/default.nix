{
  pkgs,
  lib,
  ...
}: {

  home.file.".config/nvim/lua/treesitter/init.lua".source = ./treesitter.lua; 


  programs.neovim = {
    enable = true;
    
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;

    # extraLuaConfig = lib.fileContents ./lua.init;
    extraLuaConfig = ''
      vim.opt.number = true
      vim.opt.mouse = "a"
      vim.opt.smartcase = true
      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 2

      require("treesitter")
    '';

    plugins = with pkgs; [
      vimPlugins.nvim-tree-lua

      {
        plugin = vimPlugins.vim-startify;
        config = "let g:startify_change_to_vcs_root = 0";
      }
      vimPlugins.telescope-nvim

      vimPlugins.nvim-treesitter.withAllGrammars
    ];
  };
}