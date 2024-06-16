vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeFocus)

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set("n", "<Tab>", vim.cmd.BufferNext)
vim.keymap.set("n", "<S-L><Tab>", vim.cmd.BufferPrevious)
vim.keymap.set("n", "<C-L>w", vim.cmd.BufferClose)
