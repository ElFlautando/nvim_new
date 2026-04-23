
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

return keymaps

