return {
  cmd = {
    -- see clangd --help-hidden
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--all-scopes-completion",
    "--header-insertion-decorators",
    "--pch-storage=memory",
    "--completion-style=bundled",
    "--header-insertion=iwyu",
  },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", },
  init_options = {
    clangdFileStatus = true,     -- Provides information about activity on clangd’s per-file worker thread
    usePlaceholders = true,
    completeUnimported = true,
    semanticHighlighting = true,
    fallbackFlags = { "-std=c++23", },
  },
  root_markers = { ".clangd","clang-tidy", ".git", "compile_commands.json", },
  single_file_support = true,
}
