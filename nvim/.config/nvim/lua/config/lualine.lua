local M = {
  "nvim-lualine/lualine.nvim",
}

function M.config()
  local diff = {
    "diff",
    colored = false,
  }

  require("lualine").setup {
    options = {
      theme = "nord",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = { diff },
      lualine_x = { "diagnostics" },
      lualine_y = { "filetype" },
      lualine_z = { "progress" },
    },
    extensions = { "quickfix", "man", "fugitive" },
  }
end

return M
