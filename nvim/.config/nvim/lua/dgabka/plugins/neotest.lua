return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "marilari88/neotest-vitest",
  },
  config = function()
    require("neotest").setup {
      adapters = {
        require "neotest-vitest",
      },
    }

    vim.keymap.set("n", "<leader>tn", function()
      require("neotest").run.run()
    end, { desc = "Run Nearest Test" })
    vim.keymap.set("n", "<leader>tf", function()
      require("neotest").run.run(vim.fn.expand "%")
    end, { desc = "Run File" })
    vim.keymap.set("n", "<leader>ts", function()
      require("neotest").run.stop()
    end, { desc = "Stop Test" })
    vim.keymap.set("n", "<leader>to", function()
      require("neotest").output.open { enter = true }
    end, { desc = "Show Output" })
    vim.keymap.set("n", "<leader>tsu", function()
      require("neotest").summary.toggle()
    end, { desc = "Toggle Summary" })
    vim.keymap.set("n", "<leader>tw", function()
      require("neotest").watch.toggle(vim.fn.expand "%")
    end, { desc = "Toggle watch mode" })
  end,
}
