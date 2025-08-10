vim.diagnostic.config {
  virtual_text = false,
  update_in_insert = true,
  severity_sort = true,
  float = {
    header = "",
    border = "rounded",
    style = "minimal",
    prefix = "",
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
}
