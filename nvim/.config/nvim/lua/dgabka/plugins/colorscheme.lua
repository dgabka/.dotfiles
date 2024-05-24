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
                    ["@lsp.type.property.nix"] = { fg = "text" },
                    ["@lsp.type.property.lua"] = { fg = "text" },
                    ["@constructor.lua"] = { fg = "muted" },
                    ["@variable.member.typescript"] = { fg = "text" },
                    ["@type.builtin.typescript"] = { fg = "iris" },
                    ["@lsp.type.parameter.typescript"] = { fg = "text" },
                    ["@lsp.type.property.typescript"] = { fg = "text" },
                    ["@lsp.type.interface.typescript"] = { fg = "iris" },
                    ["@function.method.call.typescript"] = { fg = "rose" },
                    ["@lsp.type.property.typescriptreact"] = { fg = "text" },
                    ["@tag.tsx"] = { fg = "text" },
                    ["@type.toml"] = { fg = "iris" },
                    ["@property.toml"] = { fg = "text" },
                },
            }
            vim.cmd.colorscheme "rose-pine"
        end,
    },
}
