require("main.options")

require("pluginConfig.treesitter")
require("pluginConfig.telescope")
require("pluginConfig.lspConfig")

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
})

require("main.keymaps")

vim.cmd("colorscheme onedark")