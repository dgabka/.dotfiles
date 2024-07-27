-- Ctrl-C to exit insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- open oil
vim.keymap.set("n", "<leader>-", ":Oil<CR>")

-- quickfix list
vim.keymap.set("n", "<leader>co", ":copen<CR>", { desc = "Open" })
vim.keymap.set("n", "<leader>cn", ":cnext<CR>", { desc = "Next" })
vim.keymap.set("n", "<leader>cp", ":cprev<CR>", { desc = "Prev" })
vim.keymap.set("n", "<leader>cc", ":cclose<CR>", { desc = "Close" })

-- move visual selection up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- replace paste without overwriting register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- yank to system clipboard
vim.keymap.set("v", "<leader>y", [["+y]], { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>y", [["+Y]], { desc = "Yank line to clipboard" })
