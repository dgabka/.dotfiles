---@module "lazy"
---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPre",
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "vimdoc",
        "javascript",
        "typescript",
        "lua",
        "nix",
        "bash",
      },
      sync_install = false,
      auto_install = true,
      indent = {
        enable = true,
      },
      highlight = {
        enable = true,
      },
    }
  end,
}
