return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- completions from your LSP
    "hrsh7th/cmp-buffer",   -- completions from words in open buffers
    "hrsh7th/cmp-path",     -- completions for file paths
    "saadparwaiz1/cmp_luasnip",
  },
  event = "InsertEnter",
  config = function()
    local cmp = require("cmp")
    local keymaps = require("config.keymapping")

    cmp.setup({
      -- Completion sources
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
      }),

      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },

      -- Keymapping
      mapping = cmp.mapping.preset.insert(keymaps.cmp()),


      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    })
  end,
}
