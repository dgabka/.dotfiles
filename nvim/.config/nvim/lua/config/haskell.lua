local M = {
  "mrcjkb/haskell-tools.nvim",
  version = "^3", -- Recommended
  ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
  lazy = false,
}

function M.config()
  require "haskell-tools"

  local ok, telescope = pcall(require, "telescope")
  if ok then
    telescope.load_extension "ht"
  end
end

return M
