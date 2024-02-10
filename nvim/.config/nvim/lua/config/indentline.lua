local icons = require "config.icons"
local M = {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
}

function M.config()
  require("ibl").setup {
    indent = {
      char = icons.ui.LineLeft,
    },
    exclude = {
      filetypes = {
        "help",
        "lazy",
        "oil",
        "text",
      },
    },
    scope = {
      show_start = false,
      show_end = false,
    },
  }
end

return M
