vim.opt.guicursor = ''
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.scrolloff = 8

-- transparent colorscheme
vim.cmd.colorscheme('slate')
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none'})
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none'})

vim.g.mapleader = ' '
