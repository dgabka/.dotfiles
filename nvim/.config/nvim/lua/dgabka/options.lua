vim.g.mapleader = " "

vim.opt.signcolumn = "yes"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.cursorline = true -- highlight the current line
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.smartindent = true
vim.opt.updatetime = 100
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.autoread = true -- reload files changed outside of vim
vim.opt.inccommand = "split"
vim.opt.swapfile = false
vim.opt.winborder = "solid"

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menu,menuone,noselect"
vim.o.termguicolors = true
