require("main.options")

require("pluginConfig.treesitter")

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
})

require("main.keymaps")