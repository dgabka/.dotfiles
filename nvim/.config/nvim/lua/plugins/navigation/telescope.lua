return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-lua/plenary.nvim",
  },
  lazy = true,
  cmd = "Telescope",
  config = function()
    local icons = require "config.icons"
    local actions = require "telescope.actions"

    require("telescope").setup {
      defaults = {
        prompt_prefix = icons.ui.Telescope .. " ",
        path_display = { "smart" },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob=!.git/",
        },

        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,

            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            -- ["<c-d>"] = actions.delete_buffer,
          },
          n = {
            ["<esc>"] = actions.close,
            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["q"] = actions.close,
            -- ["<c-d>"] = actions.delete_buffer,
          },
        },
      },
      pickers = {
        live_grep = {
          theme = "dropdown",
        },

        grep_string = {
          theme = "dropdown",
        },

        find_files = {
          theme = "ivy",
          previewer = true,
          layout_config = {
            height = 0.7,
          },
        },
        git_files = {
          theme = "ivy",
          previewer = true,
          layout_config = {
            height = 0.7,
          },
        },
        git_status = {
          layout_config = {
            preview_width = 0.5,
          },
        },
        help_tags = {
          layout_strategy = "vertical",
          layout_config = {
            height = 0.95,
            width = 140,
          },
        },
        buffers = {
          theme = "dropdown",
          previewer = false,
          initial_mode = "normal",
          mappings = {
            i = {
              ["<C-d>"] = actions.delete_buffer,
            },
            n = {
              ["dd"] = actions.delete_buffer,
            },
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        },
        ["ui-select"] = require("telescope.themes").get_cursor {
          previewer = false,
        },
      },
    }

    require("telescope").load_extension "ui-select"
  end,
}
