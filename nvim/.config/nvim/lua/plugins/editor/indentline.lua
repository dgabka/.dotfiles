local icons = require "config.icons"
return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {

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
  },
}
