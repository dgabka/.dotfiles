-- Configuration for luacheck to use with Neovim configuration

-- Standard globals from Neovim's Lua API
globals = {
    "vim", -- Neovim's global object
}

-- Ignore certain warnings
-- Adjust as needed to match your coding style
ignore = {
    "211", -- Unused function arguments
    "212", -- Unused variables
    "213", -- Unused loop variables
    "631", -- Line contains trailing whitespace
    "113", -- Undefined global variable (for Neovim custom globals/plugins)
}

-- Set up allowed standard libraries
std = "luajit" -- Neovim typically uses LuaJIT

-- Additional settings
read_globals = {
    "use", -- Common in packer.nvim configurations
    "require", -- Frequently used Lua function
}

max_line_length = 120 -- Adjust as needed for your codebase
