return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    strategies = {
      chat = { adapter = "anthropic" },
      inline = { adapter = "anthropic" },
      cmd = { adapter = "anthropic" },
    },
    -- adapters = {
    --   anthropic = function()
    --     return require("codecompanion.adapters").extend("anthropic", {
    --       name = "claude",
    --       schema = {
    --         model = { default = "claude-3-7-sonnet" },
    --       },
    --       -- env = {
    --       --   api_key = "cmd:pass show anthropic/api",
    --       -- },
    --     })
    --   end,
    -- },
  },
}
