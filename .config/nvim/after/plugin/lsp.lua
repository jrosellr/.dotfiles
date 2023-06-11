local lsp_zero_ok, lsp_zero = pcall(require, 'lsp-zero')
if not lsp_zero_ok then
  return
end

lsp_zero.preset('recommended')

lsp_zero.ensure_installed({
  'tsserver',
  'rust_analyzer',
})

lsp_zero.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

-- Fix Undefined global 'vim'
lsp_zero.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim', 'augroup' }
      }
    }
  }
})

lsp_zero.on_attach(function(client, bufnr)
  local opts = {
    noremap = true,
    silent = true,
    buffer = bufnr,
  }

  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

    vim.api.nvim_create_autocmd('BufWritePre', {
      callback = function()
        vim.lsp.buf.format()
      end,
    })
  end

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>qd", function() vim.diagnostic.setqflist() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

local lsp_config_ok, lsp_config = pcall(require, 'lspconfig')
if not lsp_config_ok then
  return
end

lsp_config.angularls.setup {}
lsp_config.bashls.setup({
  filetypes = { "sh", "zsh", "bash" },
})

lsp_zero.setup()

vim.diagnostic.config({
  virtual_text = true
})
