---@module "lazy"
---@type LazySpec
return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "marilari88/neotest-vitest",
  },

  keys = {
    { "<leader>tn", ":Neotest run<CR>", desc = "Neotest run nearest" },
    { "<leader>tf", ":Neotest run file<CR>", desc = "Neotest run file" },
  },

  config = function()
    require("neotest").setup {
      adapters = {
        require "neotest-vitest",
      },
    }

    vim.keymap.set("n", "<leader>ts", function()
      require("neotest").run.stop()
    end, { desc = "Stop Test" })
    vim.keymap.set("n", "<leader>to", function()
      require("neotest").output.open { enter = true }
    end, { desc = "Show Output" })
    vim.keymap.set("n", "<leader>tsu", function()
      require("neotest").summary.toggle()
    end, { desc = "Toggle Summary" })
  end,
}
