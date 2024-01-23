local M = {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 1000,
}

function M.config()
  require("rose-pine").setup {
    variant = "moon",
    disable_italics = true,

    highlight_groups = {
      Comment = { italic = true },
    },
  }
  vim.cmd.colorscheme "rose-pine"
end

return M
