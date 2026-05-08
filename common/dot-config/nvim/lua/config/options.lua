-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

-- Set tabstop and shiftwidth to 2 spaces
opt.tabstop = 2 -- Number of spaces a tab character represents
opt.shiftwidth = 2 -- Number of spaces used for auto-indent
opt.expandtab = true -- Use spaces instead of tab characters

-- Set terminal title
opt.title = true
opt.titleold = ""
opt.titlestring = "nvim %F"

-- Enable relative line numbers
opt.numberwidth = 5
opt.relativenumber = true

-- Backspace behavior and file-related settings
opt.backspace = "indent,eol,start" -- Equivalent to `set backspace=2`
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- History and cursor behavior
opt.history = 50
opt.ruler = true -- Show cursor position
opt.showcmd = true -- Display incomplete commands

-- Status line and auto-write
opt.laststatus = 2 -- Always display the status line
opt.autowrite = true -- Auto-write before commands

-- Searching
opt.incsearch = true -- Incremental search
opt.ignorecase = true -- Ignore case
opt.smartcase = true -- Override ignorecase with uppercase
opt.hlsearch = true -- Highlight search terms

-- Set character encoding
opt.encoding = "utf-8"
