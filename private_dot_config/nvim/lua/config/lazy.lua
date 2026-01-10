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
    -- import your plugins
    "itchyny/lightline.vim",
    "justinmk/vim-dirvish",
    {
      'neovim/nvim-lspconfig',
      dependencies = {
        'hrsh7th/cmp-nvim-lsp',
      },
      config = function()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        -- Configure Pyright
        vim.lsp.config('pyright', {
          capabilities = capabilities,
        })

        -- Configure TypeScript Language Server (only for Node.js projects)
        vim.lsp.config('ts_ls', {
          capabilities = capabilities,
          root_markers = { 'package.json' },
        })

        -- Configure ESLint (only for Node.js projects)
        vim.lsp.config('eslint', {
          capabilities = capabilities,
          root_markers = { 'package.json' },
        })

        -- Configure Deno (exclude Node.js projects)
        vim.lsp.config('denols', {
          capabilities = capabilities,
          root_markers = { 'deno.json', 'deno.jsonc', 'deps.ts', 'import_map.json' },
          init_options = {
            lint = true,
            unstable = true,
            suggest = {
              hosts = {
                ['https://deno.land'] = true,
                ['https://cdn.nest.land'] = true,
                ['https://crux.land'] = true,
              }
            }
          }
        })
      end,
    },
    {
      "williamboman/mason.nvim",
      config = function()
        require('mason').setup{}
      end,
    },
    {
      "williamboman/mason-lspconfig.nvim",
      dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
      },
      config = function()
        require('mason-lspconfig').setup{
          ensure_installed = { 'pyright', 'ts_ls', 'eslint', 'denols' },
          -- automatic_enable is true by default, so installed servers will be enabled automatically
        }
      end,
    },
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
      },
    },
    {
      "AlessandroYorba/Sierra",
      lazy = false, -- make sure we load this during startup if it is your main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp = require"cmp"
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
  })
})
