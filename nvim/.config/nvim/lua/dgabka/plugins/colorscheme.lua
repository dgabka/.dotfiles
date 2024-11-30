return {
    {
        "dgabka/labyrinth-nvim",
        name = "labyrinth",
        priority = 1000,
        config = function()
            local variant = os.getenv "LABYRINTH_VARIANT" or "mist"
            require("labyrinth").setup {
                variant = variant,
                styles = {
                    italic = false,
                },
                highlight_groups = {
                    TelescopeBorder = { fg = "overlay", bg = "overlay" },
                    TelescopeNormal = { fg = "subtle", bg = "overlay" },
                    TelescopeSelection = { fg = "text", bg = "highlight_med" },
                    TelescopeSelectionCaret = { fg = "amber", bg = "highlight_med" },
                    TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },
                    TelescopeTitle = { fg = "base", bg = "moss" },
                    TelescopePromptTitle = { fg = "base", bg = "moss" },
                    TelescopePreviewTitle = { fg = "base", bg = "moss" },
                    TelescopePromptNormal = { fg = "text", bg = "surface" },
                    TelescopePromptBorder = { fg = "surface", bg = "surface" },
                },
            }
            vim.cmd.colorscheme "labyrinth"
        end,
    },
    { "norcalli/nvim-colorizer.lua" },
}
