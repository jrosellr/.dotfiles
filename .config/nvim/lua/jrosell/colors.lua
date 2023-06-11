local catppuccin_ok, catppuccin = pcall(require, 'catppuccin')
if not catppuccin_ok then
  return
end

catppuccin.setup({
  term_colors = true,  -- Enable terminal UI colors
  no_italic = true,    -- Force no italic
  no_bold = true,      -- Force no bold
  no_underline = true, -- Force no underline
  custom_highlights = function(colors)
    return {
      ["@tag.html"] = { fg = colors.blue },
      ["@tag.attribute.html"] = { fg = colors.yellow },
    }
  end
})

vim.cmd('colorscheme catppuccin')
