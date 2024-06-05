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

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
        vim.lsp.handlers["textDocument/signatureHelp"] =
            vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

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
    end,
}
