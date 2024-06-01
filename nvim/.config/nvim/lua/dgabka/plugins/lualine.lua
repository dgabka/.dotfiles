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
            lualine_c = { { "filename", path = 1 }, { "diff", colored = true } },
            lualine_x = { "diagnostics" },
            lualine_y = { "filetype", "location" },
            lualine_z = { "ObsessionStatus" },
        },
        extensions = { "fugitive", "nvim-dap-ui", "oil", "trouble" },
    },
}
