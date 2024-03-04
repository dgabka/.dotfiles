return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    opts = {

      variant = "moon",
      disable_italics = false,

      highlight_groups = {
        Comment = { italic = true },
      },
    },
    config = function()
      vim.cmd.colorscheme "rose-pine-moon"
    end,
  },
}
