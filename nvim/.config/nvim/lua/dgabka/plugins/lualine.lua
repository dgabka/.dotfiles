local function xcodebuild_device()
    if vim.g.xcodebuild_platform == "macOS" then
        return " macOS"
    end

    local deviceIcon = ""
    if vim.g.xcodebuild_platform:match "watch" then
        deviceIcon = "􀟤"
    elseif vim.g.xcodebuild_platform:match "tv" then
        deviceIcon = "􀡴 "
    elseif vim.g.xcodebuild_platform:match "vision" then
        deviceIcon = "􁎖 "
    end

    if vim.g.xcodebuild_os then
        return deviceIcon .. " " .. vim.g.xcodebuild_device_name .. " (" .. vim.g.xcodebuild_os .. ")"
    end

    return deviceIcon .. " " .. vim.g.xcodebuild_device_name
end

local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
        }
    end
end

return {
    "nvim-lualine/lualine.nvim",
    opts = {
        options = {
            theme = "labyrinth-alt",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch" },
            lualine_c = { { "filename", path = 1 }, { "diff", colored = true, source = diff_source } },
            lualine_x = {
                "diagnostics",
                { "' ' .. vim.g.xcodebuild_last_status" },
                { "'󰙨 ' .. vim.g.xcodebuild_test_plan" },
                { xcodebuild_device },
            },
            lualine_y = { "filetype", "location" },
            lualine_z = { "ObsessionStatus" },
        },
        extensions = { "fugitive", "nvim-dap-ui", "oil", "trouble" },
    },
}
