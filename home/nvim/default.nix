{
  pkgs,
  lib,
  ...
}: {

  home.file.".config/nvim/lua/main/init.lua".source = ./init.lua; 
  home.file.".config/nvim/lua/main/options.lua".source = ./options.lua; 
  home.file.".config/nvim/lua/main/keymaps.lua".source = ./keymap.lua; 
  home.file.".config/nvim/lua/pluginConfig/treesitter/init.lua".source = ./treesitter.lua; 
  home.file.".config/nvim/lua/pluginConfig/telescope/init.lua".source = ./telescope.lua; 
  home.file.".config/nvim/lua/pluginConfig/lspConfig/init.lua".source = ./lspConfig.lua; 


  programs.neovim = {
    enable = true;
    
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;

    # extraLuaConfig = lib.fileContents ./lua.init;
    extraLuaConfig = ''
      require("main")
    '';

    plugins = with pkgs; [
      vimPlugins.nvim-tree-lua
      vimPlugins.undotree
      vimPlugins.telescope-nvim

      {
        plugin = vimPlugins.vim-startify;
        config = "let g:startify_change_to_vcs_root = 0";
      }

      vimPlugins.onedark-nvim

      vimPlugins.nvim-treesitter.withAllGrammars

      vimPlugins.nvim-lspconfig
      vimPlugins.lsp-zero-nvim
      vimPlugins.lspkind-nvim
      vimPlugins.luasnip
      vimPlugins.cmp-nvim-lsp
      vimPlugins.nvim-cmp
    ];
  };
}