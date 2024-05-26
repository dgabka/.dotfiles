return {
    {
        "rose-pine/neovim",
        name = "rose-pine",

        priority = 1000,
        config = function()
            require("rose-pine").setup {
                variant = "main",
                disable_italics = true,
                dim_inactive_windows = true,

                highlight_groups = {
                    Label = { fg = "pine" },

                    ["@field"] = { fg = "text" },
                    ["@variable.member"] = { fg = "text" },
                    ["@property"] = { fg = "text", italic = false },

                    ["@type"] = { fg = "iris" },
                    ["@type.builtin"] = { fg = "iris", bold = true, italic = true },

                    ["@constructor.lua"] = { fg = "muted" },

                    ["@markup.heading"] = { fg = "rose" },

                    TelescopeTitle = { fg = "pine", bold = true },
                },
            }
            vim.cmd.colorscheme "rose-pine"
        end,
    },
}
