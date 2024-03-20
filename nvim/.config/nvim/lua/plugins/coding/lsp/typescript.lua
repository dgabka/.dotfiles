return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  config = function()
    require("typescript-tools").setup {}
    -- TODO: add keymaps for new functionality
  end,
}
