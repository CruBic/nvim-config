local options = {
  formatters_by_ft = {
    lua = { "styleua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = {"eslint_d", "prettier", stop_after_first = true },
    typescript = { "eslint_d", "prettier", stop_after_first = true },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 1000,
    lsp_fallback = true,
  },
}

return options
