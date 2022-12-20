-- general
vim.opt.timeoutlen = 50
vim.opt.cursorline = false
vim.opt.hidden = true
vim.opt.rnu = true
lvim.transparent_window = true
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "catppuccin-macchiato"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-L>"] = "<cmd>BufferLineCycleNext<cr>"
lvim.keys.normal_mode["<S-H>"] = "<cmd>BufferLineCyclePrev<cr>"

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.project.active = false
lvim.lsp.diagnostics.virtual_text = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"tsx",
	"css",
	"rust",
	"java",
	"yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{
		command = "prettier",
	},
	{
		command = "stylua",
	},
	{
		command = "shellharden",
	},
	{
		command = "rustfmt",
	},
})

-- -- set additional linters
-- local linters = require("lvim.lsp.null-ls.linters")

-- set additional code actions
-- local code_actions = require("lvim.lsp.null-ls.code_actions")
-- code_actions.setup({
-- 	{
-- 		exe = "eslint",
-- 		filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue" },
-- 	},
-- })

---@diagnostic disable-next-line: missing-parameter
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })

local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
require("dap-vscode-js").setup({
	-- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
	debugger_path = mason_path .. "packages/js-debug-adapter", -- Path to vscode-js-debug installation.
	-- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
	adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
})

require("dap").configurations["javascript"] = {
	{
		type = "pwa-node",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		cwd = "${workspaceFolder}",
	},
	{
		type = "pwa-node",
		request = "attach",
		name = "Attach",
		processId = require("dap.utils").pick_process,
		cwd = "${workspaceFolder}",
	},
}

require("dap").configurations["typescript"] = {
	{
		type = "pwa-node",
		request = "launch",
		name = "Launch Typescript file",
		program = "${file}",
		cwd = "${workspaceFolder}",
		protocol = "inspector",
		console = "integratedTerminal",
		runtimeExecutable = "${workspaceFolder}/node_modules/.bin/ts-node",
		resolveSourceMapLocations = {
			"${workspaceFolder}/dist/**/*.js",
			"${workspaceFolder}/**",
			"!**/node_modules/**",
		},
		skipFiles = { "<node_internals>/**", "**/node_modules/**" },
		port = 9229,
		sourceMaps = true,
	},
	{
		type = "pwa-node",
		request = "launch",
		name = "Jest",
		program = "${file}",
		cwd = "${workspaceFolder}",
		protocol = "inspector",
		console = "integratedTerminal",
		runtimeExecutable = "${workspaceFolder}/node_modules/jest/bin/jest.js",
runtimeArgs = {'${file}'},
		resolveSourceMapLocations = {
			"${workspaceFolder}/dist/**/*.js",
			"${workspaceFolder}/**",
			"!**/node_modules/**",
		},
		skipFiles = { "<node_internals>/**", "**/node_modules/**" },
		port = 9229,
		sourceMaps = true,
	},
}

-- Additional Plugins
lvim.plugins = {
	{
		"catppuccin/nvim",
		as = "catppuccin",
	},
	{
		"simrat39/rust-tools.nvim",
		config = function()
			local status_ok, rust_tools = pcall(require, "rust-tools")
			if not status_ok then
				return
			end

			local opts = {
				tools = {
					executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
					reload_workspace_from_cargo_toml = true,
					inlay_hints = {
						auto = true,
						only_current_line = false,
						show_parameter_hints = true,
						parameter_hints_prefix = "<-",
						other_hints_prefix = "=>",
						max_len_align = false,
						max_len_align_padding = 1,
						right_align = false,
						right_align_padding = 7,
						highlight = "Comment",
					},
					hover_actions = {
						border = {
							{ "╭", "FloatBorder" },
							{ "─", "FloatBorder" },
							{ "╮", "FloatBorder" },
							{ "│", "FloatBorder" },
							{ "╯", "FloatBorder" },
							{ "─", "FloatBorder" },
							{ "╰", "FloatBorder" },
							{ "│", "FloatBorder" },
						},
						auto_focus = true,
					},
				},
				server = {
					on_attach = require("lvim.lsp").common_on_attach,
					on_init = require("lvim.lsp").common_on_init,
					settings = {
						["rust-analyzer"] = {
							checkOnSave = {
								command = "clippy",
							},
						},
					},
				},
			}
			local path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/") or ""
			local codelldb_path = path .. "adapter/codelldb"
			local liblldb_path = path .. "lldb/lib/liblldb.so"

			if vim.fn.filereadable(codelldb_path) and vim.fn.filereadable(liblldb_path) then
				opts.dap = {
					adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
				}
			else
				local msg = "Either codelldb or liblldb is not readable."
					.. "\n codelldb: "
					.. codelldb_path
					.. "\n liblldb: "
					.. liblldb_path
				vim.notify(msg, vim.log.levels.ERROR)
			end
			rust_tools.setup(opts)
		end,
		ft = { "rust", "rs" },
	},
	{
		"alexghergh/nvim-tmux-navigation",
		config = function()
			require("nvim-tmux-navigation").setup({
				disable_when_zoomed = true, -- defaults to false
				keybindings = {
					left = "<C-h>",
					down = "<C-j>",
					up = "<C-k>",
					right = "<C-l>",
				},
			})
		end,
	},
	{
		"mxsdev/nvim-dap-vscode-js",
	},
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "zsh",
	callback = function()
		-- let treesitter use bash highlight for zsh files as well
		require("nvim-treesitter.highlight").attach(0, "bash")
	end,
})
