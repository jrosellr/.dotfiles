local treesitter_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not treesitter_ok then
  return
end

vim.api.nvim_set_hl(0, "@type.qualifier.typescript", { link = "Keyword" })
vim.api.nvim_set_hl(0, "@keyword.export.typescript", { link = "Keyword" })
vim.api.nvim_set_hl(0, "@type.builtin.typescript", { link = "Keyword" })
vim.api.nvim_set_hl(0, "@variable.builtin.typescript", { link = "Keyword" })
vim.api.nvim_set_hl(0, "@lsp.type.interface.typescript", { link = "Type" })

treesitter_configs.setup({
  ensure_installed = {
    "c",
    "lua",
    "vim",
    "query",
    "go"
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
