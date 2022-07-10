vim.g.dracula_show_end_of_buffer = 1
vim.g.dracula_transparent_bg = true
-- vim.g.dracula_lualine_bg_color = "#44475a"
vim.g.dracula_italic_comment = 1

-- Load nord colorscheme with A protected call
local colorscheme = "dracula"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
