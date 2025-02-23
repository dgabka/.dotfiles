-- We cache the results of "git rev-parse"
local is_inside_work_tree = {}

return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
        "nvim-telescope/telescope-ui-select.nvim",
        "nvim-lua/plenary.nvim",
    },
    lazy = false,
    cmd = "Telescope",
    config = function()
        local open_with_trouble = require("trouble.sources.telescope").open

        require("telescope").setup {
            defaults = {
                mappings = {
                    i = { ["<c-t>"] = open_with_trouble },
                    n = { ["<c-t>"] = open_with_trouble },
                },
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

        local builtin = require "telescope.builtin"
        vim.keymap.set("n", "<leader>ff", function()
            local cwd = vim.fn.getcwd()
            if is_inside_work_tree[cwd] == nil then
                vim.fn.system "git rev-parse --is-inside-work-tree"
                is_inside_work_tree[cwd] = vim.v.shell_error == 0
            end

            if is_inside_work_tree[cwd] then
                builtin.git_files()
            else
                builtin.find_files()
            end
        end, { desc = "Git files" })
        vim.keymap.set("n", "<leader>fl", builtin.find_files, { desc = "Files" })
        vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "References" })
        vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, { desc = "Definitions" })
        vim.keymap.set("n", "<leader>ft", builtin.lsp_type_definitions, { desc = "Type Definitions" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
    end,
}
