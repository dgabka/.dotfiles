return {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
    lazy = true,
    config = function()
        local tt = require "typescript-tools"

        tt.setup {
            settings = { expose_as_code_action = { "add_missing_imports", "organize_imports" } },
            code_lens = "all",
            tsserver_file_preferences = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
                quotePreference = "auto",
            },
            jsx_close_tag = {
                enable = true,
                filetypes = { "javascriptreact", "typescriptreact" },
            },
        }

        vim.keymap.set("n", "<leader>lo", "<cmd>TSToolsOrganizeImports<CR>", { desc = "Organize imports" })
        vim.keymap.set("n", "<leader>li", "<cmd>TSToolsAddMissingImports<CR>", { desc = "Organize imports" })
    end,
}
