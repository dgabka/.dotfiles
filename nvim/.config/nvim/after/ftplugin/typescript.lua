local which_key = require "which-key"

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

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

which_key.register(mappings, opts)

-- LSP specific keymap
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    which_key.register(mappings, vim.tbl_deep_extend("force", opts, { buffer = args.buf }))
  end,
})
