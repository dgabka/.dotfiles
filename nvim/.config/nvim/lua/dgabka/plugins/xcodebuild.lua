return {
    "wojciech-kulik/xcodebuild.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "MunifTanjim/nui.nvim",
    },
    ft = "swift",
    config = function()
        require("xcodebuild").setup {
            -- put some options here or leave it empty to use default settings
        }
    end,
}
