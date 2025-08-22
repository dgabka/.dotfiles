---@module "lazy"
---@type LazySpec
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
    vim.lsp.enable "cssls"
    vim.lsp.enable "html"
    vim.lsp.enable "pyright"
    vim.lsp.enable "bashls"
    vim.lsp.enable "marksman"
    vim.lsp.enable "dockerls"
    vim.lsp.enable "eslint"

    vim.lsp.enable "lua_ls"

    vim.lsp.config("vtsls", {
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
        vim.keymap.set("n", "<leader>lo", "<cmd>VtsExec organize_imports<CR>", { desc = "Ogranize Imports" })
        vim.keymap.set("n", "<leader>la", "<cmd>VtsExec add_missing_imports<CR>", { desc = "Add Missing Imports" })
        vim.keymap.set("n", "<leader>lr", "<cmd>VtsExec rename_file<CR>", { desc = "Rename File" })
      end,
    })
    vim.lsp.enable "vtsls"

    vim.lsp.config("jsonls", {
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })
    vim.lsp.enable "jsonls"

    vim.lsp.config("yamlls", {
      settings = {
        yaml = {
          schemaStore = { enable = true },
          schemas = require("schemastore").yaml.schemas {
            extra = {
              {
                url = "https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json",
                name = "Gitlab CI",
                fileMatch = ".gitlab-ci/*",
                description = "Gitlab CI Schema",
              },
            },
          },
        },
      },
    })
    vim.lsp.enable "yamlls"

    vim.lsp.config("nil_ls", {
      settings = {
        ["nil"] = {
          formatting = {
            command = { "alejandra" },
          },
        },
      },
    })
    vim.lsp.enable "nil_ls"

    vim.keymap.set("n", "gd", vim.lsp.buf.definition)
    vim.keymap.set("n", "gT", vim.lsp.buf.type_definition)
  end,
}
