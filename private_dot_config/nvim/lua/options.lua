local options = {
  number = true,

  mouse = "",
  clipboard = "unnamedplus",

  shiftwidth = 2,
  tabstop = 2,
	expandtab = true,
  smartindent = true,

  showmatch = true,
  matchtime = 1,

  wrapscan = true,
	ignorecase = true,
  title = true,
  swapfile = false,
  virtualedit = "onemore",
  splitbelow = true,
  splitright = true,
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.cmd[[set nofoldenable]]

