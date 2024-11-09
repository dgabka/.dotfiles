local kind_icons = {
    Text = "",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "",
    Field = "󰇽",
    Variable = "󰂡",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "󰅲",
}

local M = {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        {
            "hrsh7th/cmp-nvim-lsp",
            event = "InsertEnter",
        },
        {
            "hrsh7th/cmp-path",
            event = "InsertEnter",
        },
        {
            "hrsh7th/cmp-nvim-lua",
            event = "InsertEnter",
        },
        {
            "hrsh7th/cmp-nvim-lsp-signature-help",
            event = "InsertEnter",
        },
    },
}

function M.config()
    local cmp = require "cmp"
    -- vim.keymap.set({ "i", "s" }, "<Tab>", function()
    --     if vim.snippet.active { direction = 1 } then
    --         return "<cmd>lua vim.snippet.jump(1)<cr>"
    --     else
    --         return "<Tab>"
    --     end
    -- end, { expr = true })
    cmp.setup {
        snippet = {
            expand = function(args)
                vim.snippet.expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert {
            ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
            ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
            ["<C-e>"] = cmp.mapping {
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            },
            ["<CR>"] = cmp.mapping.confirm { select = true },
        },
        sources = {
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
            { name = "path" },
            { name = "cmp-nvim-lsp-signature-help" },
            { name = "lazydev" },
        },
        confirm_opts = {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        },
        formatting = {
            format = function(entry, vim_item)
                -- Kind icons
                vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
                -- Source
                vim_item.menu = ({
                    nvim_lsp = "[LSP]",
                    nvim_lua = "[Lua]",
                    path = "[Path]",
                })[entry.source.name]
                return vim_item
            end,
        },
        window = {
            documentation = cmp.config.window.bordered(),
        },
    }
end

return M
