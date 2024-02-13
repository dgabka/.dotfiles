local which_key = require "which-key"

local mappings = {
  r = {
    name = "Rust",
    r = { "<cmd>RustLsp runnables<CR>", "Runnables" },
    d = { "<cmd>RustLsp debuggables<CR>", "Debuggables" },
    f = { "<cmd>RustFmt<CR>", "Format" },
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
