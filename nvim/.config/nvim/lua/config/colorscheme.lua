local M = {
  "rose-pine/neovim",
  name = "rose-pine",
}

function M.config()
  require("rose-pine").setup {
    variant = "moon",
    disable_italics = false,

    highlight_groups = {
      Comment = { italic = true },
    },
  }
  vim.cmd.colorscheme "rose-pine"
end

return M
