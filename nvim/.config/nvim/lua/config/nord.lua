local M = {
  "nordtheme/vim",
  lazy = false,
  priority = 1000,
}

function M.config()
  vim.g.nord_uniform_diff_background = 1
  vim.g.nord_italic = 1
  vim.g.nord_italic_comments = 1
  vim.cmd.colorscheme "nord"
end

return M
