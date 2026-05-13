vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.backspace = { "indent", "start", "eol", }
vim.opt.scrolloff = 8
vim.opt.hidden = true
vim.opt.cmdheight = 1
vim.opt.mouse = "nv"
vim.opt.inccommand = "nosplit"
vim.opt.showmode = false
vim.opt.conceallevel = 0
vim.opt.splitright = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.pumheight = 15
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.spelloptions = "noplainbuffer"
vim.opt.signcolumn = "yes"

vim.cmd("colorscheme tokyonight")

vim.diagnostic.config({
  virtual_text = false,
  float = {
    source = "always",
    border = "rounded",
    focusable = false,
  },
})

local signs = { Error = " ", Warn = " ", Hint = "", Info = " ", }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "", })
end
