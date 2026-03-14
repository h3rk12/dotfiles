local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<Esc><Esc>', ':nohlsearch<CR><Esc>', opts)

