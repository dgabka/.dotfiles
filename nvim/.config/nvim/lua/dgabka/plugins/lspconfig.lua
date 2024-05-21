return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lspconfig = require "lspconfig"
        local servers = {
            "cssls",
            "html",
            "pyright",
            "bashls",
            "jsonls",
            "yamlls",
            "marksman",
            "dockerls",
            "nil_ls",
        }

        for _, server in pairs(servers) do
            lspconfig[server].setup {}
        end

        lspconfig.lua_ls.setup {
            settings = {
                Lua = {
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { "vim" },
                    },
                },
            },
        }

        vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
        vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action)
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename)
    end,
}
