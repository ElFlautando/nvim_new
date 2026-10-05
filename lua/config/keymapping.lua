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
    { "<leader>sg", function() Snacks.picker.grep() end,         desc = "Grep",         mode = "n" },
    { "<leader>sG", function() Snacks.picker.grep_buffers() end, desc = "Grep Buffers", mode = "n" },
  }
end

function keymaps.conform()
  return {
    { "<leader>fm", function() require('conform').format() end, desc = "format", mode = "n" },
  }
end

function keymaps.lsp(client, bufnr)
  local map = function(shortkey, cmd, desc)
    vim.keymap.set("n", shortkey, cmd, { buffer = bufnr, silent = true, desc = desc })
  end

  map("<leader>ac", vim.lsp.buf.code_action, "Code action")
  map("<leader>gd", vim.lsp.buf.declaration, "Goto declaration")
  map("<leader>gD", vim.lsp.buf.definition, "Goto definition")
  map("<leader>gi", vim.lsp.buf.implementation, "Goto implementation")
  map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
  map("<leader>lr", vim.lsp.buf.references, "List references")

  map("<leader>of", vim.diagnostic.open_float, "Show diagnostics")
end

function keymaps.hover()
  return {
    { "K",           function() require("hover").open() end,  desc = "Hover float", mode = "n", silent = true },
    { "<MouseMove>", function() require("hover").mouse() end, desc = "Hover mouse", mode = "n", silent = true },
  }

end

function keymaps.cmp()
  local cmp = require("cmp")
  local ls = require("luasnip")

  return {
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<C-Space>"] = cmp.mapping.complete(),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif ls.expand_or_jumpable() then
        ls.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
  }
end
return keymaps
