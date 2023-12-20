local M = {
  "nordtheme/vim",
  lazy = false,
  priority = 1000,
}

function M.config()
  vim.cmd.colorscheme "nord"
end

return M
