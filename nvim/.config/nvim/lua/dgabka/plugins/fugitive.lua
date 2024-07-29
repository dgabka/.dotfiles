return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gs", ":0G<CR>", { desc = "Fugitive" })
    end,
}
