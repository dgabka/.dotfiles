-- TODO: refactor mappings
local mappings = {
    l = {
        t = {
            name = "Typescript",
            o = { "<cmd>TSToolsOrganizeImports<CR>", "Organize Imports" },
            a = { "<cmd>TSToolsAddMissingImports<CR>", "Add Missing Imports" },
            d = { "<cmd>TSToolsGoToSourceDefinition<CR>", "Go To Definition" },
            x = { "<cmd>TSToolsRemoveUnused<CR>", "Remove Unused" },
            r = { "<cmd>TSToolsRenameFile<CR>", "Rename File" },
            f = { "<cmd>TSToolsFixAll<CR>", "Fix All" },
        },
    },
}

vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
