vim.g.mapleader = " "

vim.opt.signcolumn = "yes"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.wrap = false
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 8
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.cursorline = true -- highlight the current line
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.updatetime = 100

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"
vim.o.termguicolors = true

-- Diagnostic settings
vim.diagnostic.config {
  virtual_text = false,
  update_in_insert = true,
}
