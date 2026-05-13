vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    require "config.keymapping".lsp(client, ev.buf)
  end,
})
