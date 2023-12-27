local M = {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 1000,
}

function M.config()
  require("rose-pine").setup {
    variant = "moon",
  }
  vim.cmd.colorscheme "rose-pine"
end

return M
