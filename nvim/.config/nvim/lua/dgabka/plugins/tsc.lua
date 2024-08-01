return {
    "dmmulroy/tsc.nvim",
    ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
    lazy = true,
    config = function()
        local tsc = require "tsc"

        tsc.setup {
            use_trouble_qflist = true,
        }
    end,
}
