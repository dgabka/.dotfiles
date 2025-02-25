local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave", "TextChanged" }, {
    group = lint_augroup,
    callback = function()
        require("lint").try_lint()
    end,
})
