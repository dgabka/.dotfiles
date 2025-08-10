local set = vim.keymap.set

set("n", "<leader>-", ":Oil<CR>")

-- quickfix list
set("n", "<leader>co", ":copen<CR>", { desc = "Open" })
set("n", "<leader>cn", ":cnext<CR>", { desc = "Next" })
set("n", "<leader>cp", ":cprev<CR>", { desc = "Prev" })
set("n", "<leader>cc", ":cclose<CR>", { desc = "Close" })

-- move visual selection up/down
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

-- replace paste without overwriting register
set("x", "<leader>p", [["_dP]])

-- yank to system clipboard
set("v", "<leader>y", [["+y]], { desc = "Yank to clipboard" })
set("n", "<leader>y", [["+Y]], { desc = "Yank line to clipboard" })

-- toggle inlay_hints
set("n", "<space>tt", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = 0 }, { bufnr = 0 })
end)

-- These mappings control the size of splits (height/width)
set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-t>", "<C-W>+")
set("n", "<M-s>", "<C-W>-")

-- Disable hlsearch if it's on, otherwise just do "enter"
set("n", "<CR>", function()
  ---@diagnostic disable-next-line: undefined-field
  if vim.v.hlsearch == 1 then
    vim.cmd.nohl()
    return ""
  else
    return vim.keycode "<CR>"
  end
end, { expr = true })
