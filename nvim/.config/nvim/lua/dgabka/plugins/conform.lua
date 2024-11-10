return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            -- Customize or remove this keymap to your liking
            "<leader>lf",
            function()
                require("conform").format { async = true }
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    -- This will provide type hinting with LuaLS
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            javascript = { "prettierd" },
            typescript = { "prettierd" },
            swift = { "swiftformat" },
            nix = { "alejandra" },
            yaml = { "yamlfmt" },
            bash = { "shfmt" },
        },
        format_on_save = function(bufnr)
            local ignore_filetypes = { "oil" }
            if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
                return
            end

            return { timeout_ms = 500, lsp_fallback = true }
        end,
    },
}
