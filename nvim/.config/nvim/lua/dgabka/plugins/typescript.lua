return {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
    lazy = true,
    config = function()
        require("typescript-tools").setup {
            settings = { expose_as_code_action = { "add_missing_imports", "organize_imports" } },
            jsx_close_tag = {
                enable = false,
                filetypes = { "javascriptreact", "typescriptreact" },
            },
        }
    end,
}
