local M = {
  "nvim-lualine/lualine.nvim",
}

function M.config()
  local diff = {
    "diff",
    colored = true,
  }

  require("lualine").setup {
    options = {
      theme = "rose-pine-alt",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = { "filename", diff },
      lualine_x = { "diagnostics" },
      lualine_y = { "filetype" },
      lualine_z = { "searchcount" },
    },
  }
end

return M
