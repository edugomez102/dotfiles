require('indent_blankline').setup({
    show_first_indent_level = false,
    filetype_exclude = { 'help', 'packer', 'FTerm' },
    buftype_exclude = { 'terminal', 'nofile' },

    space_char_blankline = " ",
    show_current_context = true,
    -- show_current_context_start = true,
})
