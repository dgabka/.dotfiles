local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    {
      "windwp/nvim-ts-autotag",
    },
    {
      "windwp/nvim-autopairs",
    },
  },
}

function M.config()
  require("ts_context_commentstring").setup {
    enable_autocmd = false,
  }
  vim.g.skip_ts_context_commentstring_module = true
  require("nvim-treesitter.configs").setup {
    ensure_installed = { "typescript", "lua" },
    ignore_install = {},
    modules = {},
    auto_install = true,
    sync_install = true,
    highlight = {
      enable = true, -- false will disable the whole extension
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<c-space>",
        node_incremental = "<c-space>",
        scope_incremental = "<c-s>",
        node_decremental = "<M-space>",
      },
    },
    indent = {
      enable = false,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ab"] = "@block.outer",
          ["ib"] = "@block.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]m"] = "@function.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>a"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>A"] = "@parameter.inner",
        },
      },
    },
    autotag = { enable = true },

    autopairs = { enable = true },
  }
end

return M
