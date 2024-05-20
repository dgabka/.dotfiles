-- Ctrl-C to exit insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>-", ":Ex<CR>")


-- LSP specific keymap
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    -- Diagnostic keymaps
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = args.buf })
  end,
})
