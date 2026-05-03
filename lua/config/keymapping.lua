
-- Custom:

-- Remape terminal escape
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { remap = false, silent = true })

-- Shortcut save and exit
vim.keymap.set("n", "wq", ":wq<CR>")

-- Oil
vim.keymap.set("n", "<leader>oi", ":Oil<CR>", { remap = false, silent = true, unique = true })

-- Keymappings for pluggins
local keymaps = {}

function keymaps.snacks()
	return {
		{ "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
		{ "<leader>sG", function() Snacks.picker.grep_buffers() end, desc = "Grep Buffers" },
	}
end


function keymaps.lsp(client, bufnr)
  local map = function(shortkey, cmd, desc)
    vim.keymap.set("n", shortkey, cmd, { buffer = bufnr, silent = true, desc = desc })
  end

  map("<leader>fm", vim.lsp.buf.format,         "Format")
  map("<leader>ac", vim.lsp.buf.code_action,    "Code action")
  map("<leader>gd", vim.lsp.buf.declaration,    "Goto declaration")
  map("<leader>gD", vim.lsp.buf.definition,     "Goto definition")
  map("<leader>gi", vim.lsp.buf.implementation, "Goto implementation")
  map("<leader>rn", vim.lsp.buf.rename,         "Rename symbol")
  map("<leader>lr", vim.lsp.buf.references,     "List references")

  map("<leader>of", vim.diagnostic.open_float,  "Show diagnostics")
end

return keymaps

