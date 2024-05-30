return {
    {
        "rose-pine/neovim",
        name = "rose-pine",

        priority = 1000,
        config = function()
            require("rose-pine").setup {
                variant = "main",
                disable_italics = true,

                highlight_groups = {
                    Label = { fg = "pine" },
                    NormalFloat = { bg = "base" },
                    FloatBorder = { fg = "overlay", bg = "base" },

                    ["@field"] = { fg = "text" },
                    ["@variable.member"] = { fg = "text" },
                    ["@property"] = { fg = "text", italic = false },

                    ["@type"] = { fg = "iris" },
                    ["@type.builtin"] = { fg = "iris", bold = true, italic = true },

                    ["@constructor.lua"] = { fg = "muted" },

                    ["@markup.heading"] = { fg = "rose" },

                    TelescopeBorder = { fg = "overlay", bg = "base" },
                    TelescopeNormal = { fg = "subtle", bg = "base" },
                    TelescopeSelection = { fg = "text", bg = "highlight_med" },
                    TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
                    TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },
                    TelescopeTitle = { fg = "base", bg = "love" },
                    TelescopePromptTitle = { fg = "base", bg = "pine" },
                    TelescopePreviewTitle = { fg = "base", bg = "iris" },
                    TelescopePromptNormal = { fg = "text", bg = "base" },
                    TelescopePromptBorder = { fg = "overlay", bg = "base" },
                },
            }
            vim.cmd.colorscheme "rose-pine"
        end,
    },
}
