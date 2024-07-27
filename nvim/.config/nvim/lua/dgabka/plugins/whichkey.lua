return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "modern",
        icons = {
            separator = " ",
            group = "#",
            mappings = false,
        },
        sort = { "manual", "local", "order" },
        spec = {
            { "<leader>f", group = "Find" },
            { "<leader>h", group = "Hunks" },
            { "<leader>l", group = "LSP" },
            { "<leader>x", group = "Trouble" },
            { "<leader>c", group = "Quickfix" },
            { "<leader>g", group = "Git" },
        },
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show { global = false }
            end,
            desc = "Buffer Local Keymaps",
        },
    },
}
