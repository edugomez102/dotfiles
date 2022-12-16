local function map(m, k, v)
  vim.keymap.set(m, k, v, { silent = true })
end

map('i', 'jk', '<ESC>')
map('i', 'JK', '<ESC>')

map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- Exit terminal
vim.cmd('tnoremap jk <c-\\><c-n>')
vim.cmd('tnoremap JK <c-\\><c-n>')

map('n', '<leader>w', ':w!<cr>')
map('n', '<leader>tn', ':tabedit %<cr>')

--- Plugin
map('n', '<leader>e', ':NvimTreeToggle<cr>')

map('n', '<C-J>', ':Telescope find_files<cr>')
-- map('n', '<C-p>', ':Telescope buffers<cr>')

map('n', '<C-p>', ':lua require("harpoon.ui").toggle_quick_menu()<cr>')
map('n', '<C-h>', ':Telescope lsp_document_symbols<cr>')

map('n', '<leader>;', ':FloatermToggle<cr>')
map('n', '<leader>gs', ':tab Git<cr>')

map('n', '<leader>s', ':lua require("spectre").open()<cr>')
map('n', '<leader>sw', ':lua require("spectre").open_visual({select_word = true})<cr>')
map('n', '<leader>hp', ':lua require("harpoon.mark").add_file()<cr>')

map('n', '<leader>gh', ':SignifyHunkDiff<cr>')
map('n', '<leader>gu', ':SignifyHunkUndo<cr>')


-- vim.cmd [[
-- " name.s.h split len is 2
-- " name.s   split len is 1
-- function! ToggleAsmHpp()
--    let file_array = split(expand('%:r'), '\.')
--    if len(file_array) == 1
--       :e %:r.h.s
-- 	elseif len(file_array) == 2
--       exe 'e ' . file_array[0] . '.s'
-- 	end
-- endfunction
-- ]]

-- map('n', '<leader>hh', ':ClangSwitchSourceHeader<cr>')
map('n', '<leader>hh', ':call ToggleAsmHpp()<cr>')

