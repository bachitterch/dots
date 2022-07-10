----- Basic Settings -----

local set = vim.opt

set.autoindent = true
set.autochdir = true
set.autowrite = true
set.expandtab = true
set.clipboard = "unnamedplus"
set.confirm = true
set.showcmd = true
set.encoding = "utf-8"
set.fileencoding = "utf-8"
set.incsearch = true
set.linebreak = true
set.mouse = "a"
set.shell = "/bin/zsh"
set.shortmess:append "sI"
set.smarttab = true
set.swapfile = false
set.textwidth = 80
set.updatetime = 0
set.wrap = false
vim.cmd [[set nobackup]]
vim.cmd [[set nowritebackup]]
vim.cmd [[set formatoptions-=cro]]
vim.cmd [[set complete+=kspell]]
vim.cmd [[set completeopt=menuone,longest]]
vim.cmd [[set nocompatible]]

----- NeoVim Settings -----

set.background = "dark"
set.cmdheight = 1
set.ignorecase = true
set.laststatus = 3
set.number = true
set.pumheight = 15
set.ruler = true
set.shiftwidth = 2
set.smartcase = true
set.tabstop = 2
set.title = true
set.termguicolors = true
set.virtualedit = "onemore"
vim.cmd [[setlocal conceallevel=2]]
vim.cmd [[set noshowmode]]
vim.cmd [[set t_Co=256]]
vim.cmd [[syntax enable]]

----- Misc Settings -----
set.hidden = true
set.timeoutlen = 500
set.lazyredraw = true
set.synmaxcol = 240
