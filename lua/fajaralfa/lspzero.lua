local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
require('lspconfig').tsserver.setup({})
require('lspconfig').intelephense.setup({})
require('lspconfig').gopls.setup({})
require('lspconfig').clangd.setup({})
require('lspconfig').svelte.setup({})
require('lspconfig').zls.setup({})
require('lspconfig').bashls.setup({})
require('lspconfig').pyright.setup({})

lsp.setup()
