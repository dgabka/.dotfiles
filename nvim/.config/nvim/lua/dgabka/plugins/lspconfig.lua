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
            "marksman",
            "dockerls",
        }

        for _, server in pairs(servers) do
            lspconfig[server].setup {}
        end

        lspconfig.yamlls.setup {
            settings = {
                yaml = {
                    format = { enable = true },
                    schemaStore = { enable = true },
                },
            },
            on_attach = function(client, bufnr)
                client.server_capabilities.documentFormattingProvider = true
            end,
        }

        lspconfig.nil_ls.setup {
            settings = {
                ["nil"] = {
                    formatting = {
                        command = { "alejandra" },
                    },
                },
            },
        }

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

        vim.keymap.set("n", "gd", vim.lsp.buf.definition)

        vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
        vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action)
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename)
    end,
}
