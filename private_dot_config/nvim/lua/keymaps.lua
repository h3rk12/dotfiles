local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<Esc><Esc>', ':nohlsearch<CR><Esc>', opts)

-- File explorer (vim-dirvish)
map('n', '-', '<Cmd>Dirvish<CR>', opts)
map('n', '<Leader>e', '<Cmd>Dirvish %:p:h<CR>', opts)

