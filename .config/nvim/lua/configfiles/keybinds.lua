local function map(m, k, v)
  vim.keymap.set(m, k, v, { silent = true })
end

map('i', 'jk', '<ESC>')
map('i', 'JK', '<ESC>')

map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- Exit terminal
vim.cmd('tnoremap jk <c-\\><c-n>')

map('n', '<leader>w', ':w!<cr>')
map('n', '<leader>tn', ':tabedit %<cr>')

--- Plugin
map('n', '<leader>e', ':NvimTreeToggle<cr>')

map('n', '<C-J>', ':Telescope find_files<cr>')
map('n', '<C-p>', ':Telescope buffers<cr>')
map('n', '<C-h>', ':Telescope lsp_document_symbols<cr>')

map('n', '<leader>;', ':FloatermToggle<cr>')
map('n', '<leader>gs', ':tab Git<cr>')

map('n', '<leader>S', ':lua require("spectre").open()<cr>')
