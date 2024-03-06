return {
  "nanozuki/tabby.nvim",
  event = "VimEnter",
  config = function()
    require("tabby.tabline").use_preset("active_wins_at_tail", {
      tab_name = {
        name_fallback = function()
          return ""
        end,
      },
      buf_name = {
        mode = "unique",
      },
    })
  end,
}
