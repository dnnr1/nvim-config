-- ================================
--       Neovim Configuration
--       Custom Settings & Options
-- ================================

vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt
local g = vim.g

-- Performance optimizations
opt.lazyredraw = false
opt.synmaxcol = 240
opt.updatetime = 250
opt.timeoutlen = 300
opt.ttimeoutlen = 0

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
opt.backup = false
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.writebackup = false
opt.hlsearch = false
opt.incsearch = true
opt.grepprg = "rg --vimgrep"
opt.grepformat = "%f:%l:%c:%m"

-- Indentation settings
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.breakindent = true

-- Search settings
opt.ignorecase = true
opt.smartcase = true

-- Display settings
opt.wrap =true 
opt.linebreak = true
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.laststatus = 3
opt.showmode = false
opt.conceallevel = 0
opt.pumheight = 10
opt.showtabline = 2
opt.splitbelow = true
opt.splitright = true

-- File encoding
opt.fileencoding = "utf-8"

-- Fold settings
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false
opt.foldlevel = 99

-- Netrw settings
g.netrw_browse_split = 0
g.netrw_banner = 0
g.netrw_winsize = 25

-- Disable builtin plugins for faster startup
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
  g["loaded_" .. plugin] = 1
end

-- Auto commands for performance
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Auto resize splits
autocmd("VimResized", {
  group = augroup("ResizeSplits", {}),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- Remove trailing whitespace
autocmd("BufWritePre", {
  group = augroup("TrimWhitespace", {}),
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- Don't auto comment new lines
autocmd("BufEnter", {
  group = augroup("DisableAutoComment", {}),
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})

-- Close some filetypes with <q>
autocmd("FileType", {
  group = augroup("CloseWithQ", {}),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Check if we need to reload the file when it changed
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("Checktime", {}),
  command = "checktime",
})

-- Go to last location when opening a buffer
autocmd("BufReadPost", {
  group = augroup("LastPlace", {}),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Follow the cursor
autocmd("CursorMoved", {
  group = augroup("CenterCursor", {}),
  callback = function()
    vim.cmd("normal! zz")
  end,
})

