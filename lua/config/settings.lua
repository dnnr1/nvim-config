-- ================================
--       Neovim Configuration
--       Custom Settings & Options
-- ================================

vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt
local api = vim.api

-- General settings
opt.number = true
opt.relativenumber = false
opt.clipboard:append("unnamedplus")
opt.mouse = "a"
opt.scrolloff = 0
opt.sidescrolloff = 0
opt.completeopt = "menuone,noselect"
opt.backupcopy = "yes"
opt.autoread = true
opt.swapfile = false
opt.undofile = true
opt.writebackup = false
opt.hlsearch = false
opt.incsearch = true
opt.grepprg = "rg --vimgrep"
opt.grepformat = "%f:%l:%c:%m"
opt.updatetime = 300
opt.nu = true

-- Indentation settings
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Search settings
opt.ignorecase = true
opt.smartcase = true

-- Display settings
opt.wrap = true
opt.linebreak = true
opt.showbreak = "↪ "
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.laststatus = 3
opt.showmode = false

-- Miscellaneous settings
api.nvim_create_autocmd("VimResized", { command = "wincmd =" })
api.nvim_create_autocmd({ "CursorMoved", "BufEnter", "WinEnter" }, { command = "normal! zz" })

-- Disable mouse
vim.keymap.set("n", "<ScrollWheelUp>", "<Nop>", { silent = true })
vim.keymap.set("n", "<ScrollWheelDown>", "<Nop>", { silent = true })

-- Disable arrow keys
vim.keymap.set("n", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("n", "k", "gk", { noremap = true, silent = true })
