return {
  "nvim-lualine/lualine.nvim",
  opts = {

    options = {
      theme = "rose-pine-alt",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = { "filename", { "diff", colored = true } },
      lualine_x = { "diagnostics" },
      lualine_y = { "filetype" },
      lualine_z = { "ObsessionStatus" },
    },
    extentions = {
      "oil",
    },
  },
}
