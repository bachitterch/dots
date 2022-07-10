vim.api.nvim_exec([[
autocmd BufWritePre * let currPos = getpos(".")
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e
autocmd BufWritePre * cal cursor(currPos[1], currPos[2])
]], false)

-- Blinking Cursor
vim.cmd [[
		:set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
		  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
		  \,sm:block-blinkwait175-blinkoff150-blinkon175
]]

-- Abbreviations
vim.cmd([[
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev 1! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
]])

-- disable builtins plugins
local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end


local default_providers = {
  "node",
  "python3",
}

for _, provider in ipairs(default_providers) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- Vertically center document when entering insert mode
vim.api.nvim_exec([[ autocmd InsertEnter * norm zz ]], false)

-- Disable Auto Commenting
vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- Speed Things Up
vim.cmd [[silent! set updatetime=300 timeout timeoutlen=500 ttimeout ttimeoutlen=50 ttyfast lazyredraw]]

-- Disbale Word And Line Count
vim.api.nvim_exec([[ autocmd VimEnter * set noru]], false)

-- Disable Background Color Of The Cursorline
vim.cmd [[hi CursorLine cterm=underline term=underline ctermbg=NONE guibg=NONE]]

-- Remove These ~ ~ ~
vim.opt.fillchars:append { eob = " " }

-- Disbale Status Line
-- vim.api.nvim_exec([[ autocmd VimEnter * set laststatus=1]], false)
