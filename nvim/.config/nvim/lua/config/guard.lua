local M = {
  "nvimdev/guard.nvim",
  dependencies = {
    "nvimdev/guard-collection",
  },
  event = "BufEnter",
}

function M.config()
  local ft = require "guard.filetype"

  ft("lua"):fmt "stylua"
  ft("typescript,javascript,typescriptreact"):fmt "prettier"
  ft("haskell"):fmt "lsp"
  ft("java"):fmt "google-java-format"
  ft("rust"):fmt "lsp"
  ft("fish"):fmt "fish_indent"
  ft("python"):fmt "black"

  require("guard").setup {
    fmt_on_save = true,
    lsp_as_default_formatter = false,
  }
end

return M
