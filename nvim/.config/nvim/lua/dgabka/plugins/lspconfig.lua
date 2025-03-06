return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    "b0o/schemastore.nvim",
    "yioneko/nvim-vtsls",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("lspconfig.configs").vtsls = require("vtsls").lspconfig

    local lspconfig = require "lspconfig"
    local servers = {
      "cssls",
      "html",
      "pyright",
      "bashls",
      "marksman",
      "dockerls",
    }

    for _, server in pairs(servers) do
      lspconfig[server].setup {}
    end

    lspconfig.vtsls.setup {
      settings = {
        typescript = {
          tsserver = {
            experimental = {
              enableProjectDiagnostics = true,
            },
          },
          inlayHints = {
            parameterNames = { enabled = "literals" },
            parameterTypes = { enabled = true },
            variableTypes = { enabled = true },
            propertyDeclarationTypes = { enabled = true },
            functionLikeReturnTypes = { enabled = true },
            enumMemberValues = { enabled = true },
          },
        },
      },
      server_capabilities = {
        documentFormattingProvider = false,
      },
      on_attach = function()
        vim.keymap.set("n", "<leader>lo", "<cmd>VtsExec organize_imports", { desc = "Ogranize Imports" })
        vim.keymap.set("n", "<leader>lf", "<cmd>VtsExec file_references", { desc = "File References" })
        vim.keymap.set("n", "<leader>lr", "<cmd>VtsExec rename_file", { desc = "Rename File" })
      end,
    }

    lspconfig.jsonls.setup {
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    }

    lspconfig.yamlls.setup {
      settings = {
        yaml = {
          format = { enable = true },
          schemaStore = { enable = true },
          schemas = require("schemastore").yaml.schemas(),
        },
      },
      on_attach = function(client)
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
    vim.keymap.set("n", "gT", vim.lsp.buf.type_definition)
  end,
}
