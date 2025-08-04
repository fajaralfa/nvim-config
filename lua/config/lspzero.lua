local lsp_zero = require('lsp-zero').preset({})
local lspconfig = require('lspconfig')
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()


lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)


require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
  },
})


cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- Select complection
    ['<C-y>'] = cmp.mapping.confirm({select = true}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  })
})


lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())
lspconfig.tsserver.setup({})
lspconfig.intelephense.setup({})
lspconfig.gopls.setup({})
lspconfig.clangd.setup({})
lspconfig.svelte.setup({})
lspconfig.zls.setup({})
lspconfig.bashls.setup({})
lspconfig.pyright.setup({})
