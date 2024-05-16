return {
  {
    "nvimdev/guard.nvim",
    dependencies = {
      "nvimdev/guard-collection",
    },
    event = "BufEnter",
    config = function()
      local ft = require "guard.filetype"

      ft("lua"):fmt "stylua"
      ft("typescript,javascript,typescriptreact"):fmt "prettier"
      ft("haskell"):fmt "lsp"
      ft("java"):fmt "google-java-format"
      ft("rust"):fmt "lsp"
      ft("fish"):fmt "fish_indent"
      ft("python"):fmt "black"
      ft("css"):fmt "prettier"
      ft("html"):fmt "prettier"
      ft("nix"):fmt {
        cmd = "alejandra",
        stdin = true,
      }
      ft("yaml"):fmt { cmd = "yamlfmt", stdin = true }

      require("guard").setup {
        fmt_on_save = false,
        lsp_as_default_formatter = true,
      }
    end,
  },
}
