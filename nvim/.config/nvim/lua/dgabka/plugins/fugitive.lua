return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gs", ":0G<CR>")
        -- TODO: add when working on some conflict
        -- vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
        -- vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
    end,
}
