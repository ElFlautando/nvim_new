
-- Custom:

-- Remape terminal escape
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true, })

-- Shortcut save and exit
vim.keymap.set("n", "wq", ":wq<CR>")

-- Oil
vim.keymap.set("n", "<leader>oi", ":Oil<CR>", { noremap = true, silent = true })


