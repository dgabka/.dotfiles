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
    view_options = {
      -- Show files and directories that start with "."
      show_hidden = true,
      is_always_hidden = function(name, bufnr)
        if name == ".." then
          return true
        elseif name == ".git" then
          return true
        elseif name == ".DS_Store" then
          return true
        end
        return false
      end,
    },
  }
end

return M
