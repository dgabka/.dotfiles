---@module "lazy"
---@type LazySpec
return {
  "mrcjkb/rustaceanvim",
  ft = { "rust" },
  config = function()
    vim.g.rustaceanvim = {
      tools = {
        float_win_config = {
          border = "rounded",
        },
      },
      dap = {
        adapter = {
          type = "server",
          port = "${port}",
          executable = {
            -- this is bad
            command = "/nix/store/870ma82ag1fp32h1zxfixfg915s3aml9-vscode-extension-vadimcn-vscode-lldb-1.10.0/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb",
            args = { "--port", "${port}" },
          },
        },
      },
    }
  end,
}
