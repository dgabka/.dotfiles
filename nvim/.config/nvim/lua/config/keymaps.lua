-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")

vim.keymap.set("i", "<C-c>", "<Esc>")
