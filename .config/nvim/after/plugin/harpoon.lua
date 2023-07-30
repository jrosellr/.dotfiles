local harpoon_mark_ok, mark = pcall(require, 'harpoon.mark')
if not harpoon_mark_ok then
  return
end

local harpoon_ui_ok, ui = pcall(require, 'harpoon.ui')
if not harpoon_ui_ok then
  return
end

vim.keymap.set("n", "<leader>a", mark.toggle_file)
vim.keymap.set("n", "<leader>c", mark.clear_all)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
vim.keymap.set("n", "<C-h>", function()
  ui.nav_next()
end)
vim.keymap.set("n", "<C-l>", function()
  ui.nav_prev()
end)
