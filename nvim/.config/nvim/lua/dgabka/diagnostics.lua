vim.diagnostic.config {
    virtual_text = false,
    update_in_insert = true,
    severity_sort = true,
    float = {
        header = false,
        border = "rounded",
        style = "minimal",
        source = "always",
        prefix = "",
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
            [vim.diagnostic.severity.INFO] = " ",
        },
    },
}
