-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
      "nvim-telescope/telescope.nvim",
      {
          "mason-org/mason-lspconfig.nvim",
          opts = {},
          dependencies = {
              { "mason-org/mason.nvim", opts = {} },
              "neovim/nvim-lspconfig",
          },
      },
      {
          'hrsh7th/nvim-cmp',
          dependencies = {
              'hrsh7th/cmp-buffer',
              'hrsh7th/cmp-path',
              'hrsh7th/cmp-cmdline',
              'hrsh7th/cmp-nvim-lsp',
          }
      },
      {
          'hrsh7th/cmp-vsnip',
          'hrsh7th/vim-vsnip',
      },
      {
          "nvim-treesitter/nvim-treesitter",
          branch = 'master',
          lazy = false,
          build = ":TSUpdate"
      },
      {
          "folke/trouble.nvim",
          opts = {}, -- for default options, refer to the configuration section for custom setup.
          cmd = "Trouble",
          keys = {
              {
                  "<leader>xx",
                  "<cmd>Trouble diagnostics toggle<cr>",
                  desc = "Diagnostics (Trouble)",
              },
              {
                  "<leader>xX",
                  "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                  desc = "Buffer Diagnostics (Trouble)",
              },
              {
                  "<leader>cs",
                  "<cmd>Trouble symbols toggle focus=false<cr>",
                  desc = "Symbols (Trouble)",
              },
              {
                  "<leader>cl",
                  "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                  desc = "LSP Definitions / references / ... (Trouble)",
              },
              {
                  "<leader>xL",
                  "<cmd>Trouble loclist toggle<cr>",
                  desc = "Location List (Trouble)",
              },
              {
                  "<leader>xQ",
                  "<cmd>Trouble qflist toggle<cr>",
                  desc = "Quickfix List (Trouble)",
              },
          },
      }
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
