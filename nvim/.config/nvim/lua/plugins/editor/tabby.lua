return {
  "nanozuki/tabby.nvim",
  event = "VimEnter",
  config = function()
    require("tabby.tabline").use_preset("active_wins_at_end", {
      tab_name = {
        name_fallback = function()
          return ""
        end,
      },
      buf_name = {
        mode = "unique",
      },
      lualine_theme = "rose-pine-alt"
    })
  end,
}
