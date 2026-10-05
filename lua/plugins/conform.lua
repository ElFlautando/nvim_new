return {
  'stevearc/conform.nvim',
  keys = require "config.keymapping".conform,
  opts = {
    formatters_by_ft = {
      lua = { lsp_format = "fallback", },
      python = { "isort", "black", },
      markdown = { "prettier", lsp_format = "fallback", },
      javascript = { "prettier", },
      typescript = { "prettier", },
      json = { "prettier", lsp_format = "fallback", },
      zsh = { "beautysh", },
      bash = { "beautysh", },
      shell = { "beautysh", },
      html = { "htmlbeautifier", },
      xhtml = { "htmlbeautifier", },
      cmake = { "gersemi", },
      cpp = { "clang-format", },
      tex = { "latexindent", },
      bib = { "latexindent", },
      rst = { "docstrfmt", lsp_format = "fallback", },
    }
  },
}
