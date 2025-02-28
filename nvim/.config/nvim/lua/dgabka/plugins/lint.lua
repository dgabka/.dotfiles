return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require "lint"

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      lua = { "luacheck" },
    }

    lint.linters.luacheck = {
      cmd = "luacheck",
      stdin = true,
      args = {
        "--globals",
        "vim",
        "reload",
        "--",
      },
      stream = "stdout",
      ignore_exitcode = true,
      parser = require("lint.parser").from_errorformat("%f:%l:%c: %m", {
        source = "luacheck",
      }),
    }

    vim.keymap.set("n", "<leader>ll", function()
      require("lint").try_lint()
    end, { desc = "Lint file" })
  end,
}
