require('configfiles.settings')
require('configfiles.plugins')
require('configfiles.keybinds')

vim.cmd("set clipboard=unnamedplus")

-- pcall(vim.cmd, 'colorscheme everforest')
pcall(vim.cmd, 'colorscheme codedark')
