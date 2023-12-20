local M = {
  "stevearc/oil.nvim", -- More modern netrw
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.config()
  require("nvim-web-devicons").setup {
    color_icons = false,
  }
  require("oil").setup {
    default_file_explorer = true,
    columns = {
      "icon",
    },
  }
end

return M
