local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- here you can setup the language servers

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    tsserver
  },
  
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})

local cmp_action = require('lsp-zero').cmp_action()

require'cmp'.setup({
	preselect = 'item',
	formatting = {
		fields = {'abbr', 'kind', 'menu'},
		format = require('lspkind').cmp_format({
			mode = 'symbol', -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters
			ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
		}),
	},
	completion = {
		completeopt = 'menu,menuone,noinsert'
	},
})