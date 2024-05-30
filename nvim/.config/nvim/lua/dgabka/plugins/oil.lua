return {
    "stevearc/oil.nvim",
    opts = {
        view_options = {
            show_hidden = true,
            -- This function defines what is considered a "hidden" file
            is_hidden_file = function(name, bufnr)
                return vim.startswith(name, ".")
            end,
            -- This function defines what will never be shown, even when `show_hidden` is set
            is_always_hidden = function(name, bufnr)
                if name == ".." then
                    return true
                elseif name == ".git" then
                    return true
                elseif name == ".DS_Store" then
                    return true
                end
                return false
            end,
        },
    },
    -- Optional dependencies
    dependencies = { { "nvim-tree/nvim-web-devicons", opts = { color_icons = false } } },
}
