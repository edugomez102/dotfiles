local header_art = [[
███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗
████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║
██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║
██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║
██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║
╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝
]]

require('mini.sessions').setup({
  -- Whether to read latest session if Neovim opened without file arguments
  autoread = false,
  -- Whether to write current session before quitting Neovim
  autowrite = true,

  directory =  os.getenv('HOME') .. '/.local/share/nvim/session',
  file = '' -- 'Session.vim',
})

local starter = require('mini.starter')
starter.setup({
  items = {
    starter.sections.sessions(),
    { name = 'Git'      , action = 'G | only',   section = 'Actions' },
    { name = 'Update plugins'      , action = 'PackerUpdate',   section = 'Actions' },
    starter.sections.builtin_actions(),
  },
  header = header_art,
  footer = '',
})
