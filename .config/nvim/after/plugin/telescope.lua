local telescope_ok, telescope_builtin = pcall(require, "telescope.builtin")
if not telescope_ok then
  return
end

local map_options = {
  noremap = true,
  silent = true
}

vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, map_options)
vim.keymap.set("n", "<C-p>", telescope_builtin.git_files, map_options)
vim.keymap.set("n", "<leader>ps", telescope_builtin.live_grep, map_options)
vim.keymap.set("n", "<leader>8", telescope_builtin.grep_string, map_options)
vim.keymap.set("n", "<leader>7", telescope_builtin.git_bcommits, map_options)
vim.keymap.set("n", "<leader>b", telescope_builtin.git_branches, map_options)
