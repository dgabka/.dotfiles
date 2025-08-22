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

local fmt = string.format

---@module "lazy"
---@type LazySpec
return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = { "CodeCompanionChat", "CodeCompanionActions", "CodeCompanion" },
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
          schema = {
            model = {
              default = "gpt-5-2025-08-07",
            },
          },
          env = {
            api_key = "cmd:printf '%s' \"$(pass show openai-wh/api)\"",
          },
        })
      end,
    },
    prompt_library = {
      ["Vitest unit tests"] = {
        strategy = "chat",
        description = "Generate vitest unit tests",
        prompts = {
          content = [[When generating unit tests, follow these steps:

1. Use typescript and vitest package.
2. Identify the purpose of the function or module to be tested.
3. List the edge cases and typical use cases that should be covered in the tests and share the plan with the user.
4. Generate unit tests using an appropriate testing framework for the identified programming language.
5. Ensure the tests cover:
      - Normal cases
      - Edge cases
      - Error handling (if applicable)
6. Provide the generated unit tests in a clear and organized manner without additional explanations or chat.]],
          opts = {
            visible = false,
          },
          {
            role = "user",
            content = function(context)
              local code = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

              return fmt(
                [[<user_prompt>
Please generate unit tests for this code from buffer %d:

```%s
%s
```
</user_prompt>
]],
                context.bufnr,
                context.filetype,
                code
              )
            end,
            opts = {
              contains_code = true,
            },
          },
        },
      },
      ["JSDoc"] = {
        strategy = "inline",
        description = "Generate or update JSDoc comments",
        prompts = {
          content = [[When generating or updating JSDoc comments, follow these steps:

1. Identify all functions, methods, classes, and exported variables in the code.
2. Analyze parameter types, return types, default values, and any thrown errors.
3. For each function or method:
      - Document the purpose clearly in a concise summary.
      - List all parameters with their types and descriptions.
      - Specify the return type and describe what is returned.
      - Note any errors or exceptions that may be thrown.
      - Add any relevant tags (e.g., @deprecated, @async, @example) as needed.
4. For classes, document the constructor, properties, and methods.
5. Ensure comments use valid JSDoc syntax and match the code’s structure.
6. Output only the updated code with JSDoc comments, no explanations or extra text.]],
          opts = {
            visible = false,
          },
          {
            role = "user",
            content = function(context)
              local code = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

              return fmt(
                [[<user_prompt>
Please generate or update JSDoc comments for all classes, methods and functions from buffer %d:

```%s
%s
```
</user_prompt>
]],
                context.bufnr,
                context.filetype,
                code
              )
            end,
            opts = {
              contains_code = true,
            },
          },
        },
      },
    },
  },
}
