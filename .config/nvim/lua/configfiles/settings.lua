local g = vim.g
local o = vim.o

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

----- 
o.number = true
o.cursorline = true
o.scrolloff = 4
vim.cmd 'set noshowmode'

----- 
o.expandtab = true
o.wrap = true
o.autoindent = true
o.tabstop = 2
o.shiftwidth = 2

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Undo and backup optionssett
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false


--- Buffer split
o.splitright = true

g.mapleader = ' '
g.maplocalleader = ' '

o.termguicolors = true

-- vim.opt.listchars:append "trail:⌁"
-- vim.opt.listchars:append "tab:┊\"

vim.cmd 'autocmd FileType * setlocal formatoptions-=ro'

