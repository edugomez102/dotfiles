local function map(m, k, v)
  vim.keymap.set(m, k, v, { silent = true })
end

---@param m string
---@param k string
---@param commands table list of comamnds to toggle
---
local function setToggleMap(m, k, commands)
  vim.keymap.set(m, k, (function()
    local active = false
    return function()
      if(not active) then
        vim.cmd(commands[1])
      else
        vim.cmd(commands[2])
      end
      active = not active
    end
  end)(), { silent = true })
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

map('n', '<C-p>', ':Telescope oldfiles<cr>')
map('n', '<C-h>', ':Telescope lsp_document_symbols<cr>')

map('n', '<leader>;', ':FloatermToggle<cr>')

map('n', '<leader>s', ':lua require("spectre").open()<cr>')
map('n', '<leader>sw', ':lua require("spectre").open_visual({select_word = true})<cr>')
map('n', '<leader>hp', ':lua require("harpoon.mark").add_file()<cr>')

map('n', '<leader>gh', ':SignifyHunkDiff<cr>')
map('n', '<leader>gu', ':SignifyHunkUndo<cr>')

map('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<cr>')

-- TODO: improve
map('n', '<leader>hh', ':lua require("lspconfig")["clangd"].commands.ClangdSwitchSourceHeader[1]()<cr>')

-- from current to file end: .,$, all file: %
vim.cmd('nnoremap <leader>r :.,$s/\\v(<<C-r><C-w>>)/<C-r><C-w>/g<Left><Left>')

-- TODO: try telescope-undo
-- TODO fails if tab closed manually
setToggleMap('n', 'U',
  {'tabedit % | UndotreeToggle',
  'UndotreeToggle | tabclose'})

setToggleMap('n', '<leader>gs', {'tab Git', 'tabclose'})

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
-- map('n', '<leader>hh', ':call ToggleAsmHpp()<cr>')

