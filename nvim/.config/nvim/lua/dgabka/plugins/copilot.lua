return {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
        -- Optional configurations for Copilot
        -- vim.g.copilot_no_tab_map = true -- Disable default <Tab> mapping
        -- vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end,
}
