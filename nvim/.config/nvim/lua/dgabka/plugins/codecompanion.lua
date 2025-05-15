local function get_hostname()
  -- try a list of commands until one returns a non-empty result
  local cmds = {
    "hostname",
    "uname -n",
    "scutil --get HostName",
    "scutil --get LocalHostName",
  }

  for _, cmd in ipairs(cmds) do
    local fh = io.popen(cmd .. " 2>/dev/null")
    if fh then
      local name = fh:read "*l"
      fh:close()
      if name and name:match "%S" then
        -- trim leading/trailing whitespace
        return name:match "^%s*(.-)%s*$"
      end
    end
  end

  -- fallback to the HOSTNAME env var (sometimes unset on macOS)
  local env = os.getenv "HOSTNAME"
  return (env and env:match "%S" and env:match "^%s*(.-)%s*$") or ""
end

local function get_adapters()
  local hostname = get_hostname()

  local use_openai = (hostname == "WHM5006336.local")
  local adapter = use_openai and "openai" or "anthropic"

  return {
    chat = { adapter = adapter },
    inline = { adapter = adapter },
    cmd = { adapter = adapter },
  }
end

return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    strategies = get_adapters(),
    adapters = {
      anthropic = function()
        return require("codecompanion.adapters").extend("anthropic", {
          name = "claude",
          env = {
            api_key = "cmd:printf '%s' \"$(pass show anthropic/api)\"",
          },
        })
      end,
      openai = function()
        return require("codecompanion.adapters").extend("openai", {
          env = {
            api_key = "cmd:printf '%s' \"$(pass show openai-wh/api)\"",
          },
        })
      end,
    },
  },
}
