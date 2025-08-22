---@module "lazy"
---@type LazySpec
return {
  "mrcjkb/haskell-tools.nvim",
  ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
  lazy = true,
  config = function()
    vim.g.haskell_tools = {
      hls = {
        settings = {
          haskell = {
            formattingProvider = "ormolu",
          },
        },
      },
    }
    require "haskell-tools"

    local ok, telescope = pcall(require, "telescope")
    if ok then
      telescope.load_extension "ht"
    end
  end,
}
