local function common_capabilities()
  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if status_ok then
    return cmp_nvim_lsp.default_capabilities()
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }

  return capabilities
end

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "folke/neodev.nvim",
    },
    {
      "mfussenegger/nvim-dap",
    },
    {
      "rcarriga/nvim-dap-ui",
    },
  },
  config = function()
    require("neodev").setup {
      library = { plugins = { "nvim-dap-ui" }, types = true },
    }

    local lspconfig = require "lspconfig"
    local icons = require "config.icons"

    local servers = {
      "lua_ls",
      "cssls",
      "html",
      "pyright",
      "bashls",
      "jsonls",
      "yamlls",
      "marksman",
      "dockerls",
    }

    local default_diagnostic_config = {
      signs = {
        active = true,
        values = {
          { name = "DiagnosticSignError", text = icons.diagnostics.Error },
          { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
          { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
          { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
        },
      },
      virtual_text = false,
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    }

    vim.diagnostic.config(default_diagnostic_config)

    for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
    end

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    vim.lsp.handlers["textDocument/signatureHelp"] =
      vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
    require("lspconfig.ui.windows").default_options.border = "rounded"

    for _, server in pairs(servers) do
      local opts = {
        capabilities = common_capabilities(),
      }

      local require_ok, settings = pcall(require, "config.lspsettings." .. server)
      if require_ok then
        opts = vim.tbl_deep_extend("force", settings, opts)
      end

      lspconfig[server].setup(opts)
    end

    -- TODO: cleanup DAP config, maybe move to a separate file
    require("dapui").setup()

    local dap, dapui = require "dap", require "dapui"
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#eb6f92" })
    vim.api.nvim_set_hl(0, "DapStopped", { fg = "#f6c177" })
    vim.fn.sign_define("DapBreakpoint", { text = icons.ui.Bug, texthl = "DapBreakpoint" })
    vim.fn.sign_define("DapStopped", { text = icons.ui.BoldArrowRight, texthl = "DapStopped" })
  end,
}
