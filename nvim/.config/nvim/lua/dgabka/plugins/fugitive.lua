---@module "lazy"
---@type LazySpec
return {
  "tpope/vim-fugitive",
  keys = {
    { "<leader>gs", "<cmd>0G<CR>", desc = "Fugitive satus" },
    { "<leader>gl", "<cmd>0Gclog<CR>", desc = "File revision history" },
  },
}
