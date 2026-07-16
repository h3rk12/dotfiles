require("options")
require("keymaps")

require("config.lazy")

local herdr_nav = vim.fn.glob(vim.fn.expand("~/.config/herdr/plugins/github/vim-herdr-navigation-*/editor/nvim.lua"))
if herdr_nav ~= "" then
  dofile(herdr_nav)
end

vim.cmd[[colorscheme sierra]]

