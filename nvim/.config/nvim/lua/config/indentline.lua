local M = {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "VeryLazy",
}

function M.config()
  require("ibl").setup {
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
