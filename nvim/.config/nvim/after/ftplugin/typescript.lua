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
