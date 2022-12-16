
vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerCompile',
})

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Colorschemes --
  use 'habamax/vim-alchemist'
  use 'bluz71/vim-moonfly-colors'
  use 'shaunsingh/nord.nvim'
  use 'tomasiser/vim-code-dark'
  use 'sainnhe/everforest'
  use 'habamax/vim-gruvbit'
  use 'embark-theme/vim'

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('configfiles.plugins.treesitter')
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require('configfiles.plugins.nvim-tree')
    end,
  }
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('configfiles.plugins.lualine')
    end
  }

  -- Telescope related plugins --
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('configfiles.plugins.lsp.servers')
    end
  }

  -- use{
  --   'jose-elias-alvarez/null-ls.nvim',
  -- }

  use {
    'williamboman/nvim-lsp-installer',
    requires = {
      {
        'neovim/nvim-lspconfig'
      }
    }
  }
  require("nvim-lsp-installer").setup({})
  -- use {}

  use {
    'Issafalcon/lsp-overloads.nvim',
  }


  use {
    'hrsh7th/nvim-cmp',
    requires = {
       'hrsh7th/cmp-nvim-lsp',
       'saadparwaiz1/cmp_luasnip',
       {
        'L3MON4D3/LuaSnip',
        config = function()
          require('configfiles.plugins.lsp.nvim-cmp')
          require('luasnip.loaders.from_snipmate').lazy_load()
        end,
        requires = {
          'honza/vim-snippets'
        }
       }
    }
  }

  use {
    'nvim-pack/nvim-spectre',
    config = function()
      require('spectre').setup()
    end
  }

  use{
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    config = function()
      require('configfiles.plugins.indentline')
    end,
  }
  use { 'anuvyklack/pretty-fold.nvim',
    config = function()
      require('pretty-fold').setup()
      require('pretty-fold').ft_setup('lua', {
        matchup_patterns = {
          { '^%s*do$', 'end' }, -- do ... end blocks
          { '^%s*if', 'end' },  -- if ... end
          { '^%s*for', 'end' }, -- for
          { 'function%s*%(', 'end' }, -- 'function( or 'function (''
          {  '{', '}' },
          { '%(', ')' }, -- % to escape lua pattern char
          { '%[', ']' }, -- % to escape lua pattern char
        }
      })

    end
  }

  use {
    'mfussenegger/nvim-dap',
    -- requires = {
    -- 'rcarriga/nvim-dap-ui'
    -- }
    config = function()
      require('configfiles.plugins.dap')
    end
  }

  use { 'ThePrimeagen/vim-be-good' }

  use {
    'ThePrimeagen/harpoon',
    config = function()
      require('harpoon').setup({})
      require("telescope").load_extension('harpoon')
    end
  }

  -- Extra functions
  use 'tomtom/tcomment_vim'
  -- use 'jiangmiao/auto-pairs'
  use 'sickill/vim-pasta'
  use 'tpope/vim-surround'
  use 'junegunn/vim-easy-align'
  use 'AndrewRadev/splitjoin.vim'
  use 'myusuf3/numbers.vim'

  use 'tpope/vim-eunuch'
  use 'mbbill/undotree'

  -- Git
  use 'tpope/vim-fugitive'
  use 'rhysd/git-messenger.vim'
  use {
    'akinsho/git-conflict.nvim',
    tag = "*",
    config = function()
      require('git-conflict').setup({
        default_mappings = true, -- disable buffer local mapping created by this plugin
        disable_diagnostics = true, -- This will disable the diagnostics in a buffer whilst it is conflicted
        highlights = { -- They must have background color, otherwise the default color will be used
          incoming = 'DiffText',
          current = 'DiffAdd',
        }
      })
    end
  }

  use 'rbong/vim-flog'
  use 'mhinz/vim-signify'
  vim.g.signify_sign_change = '~'
  vim.cmd "	highlight SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE "

  use 'voldikss/vim-floaterm'
  vim.g.floaterm_wintype = 'split'
  vim.g.floaterm_height = 0.3
  use 'edugomez102/vim-z80'
  -- use 'rhysd/conflict-marker.vim'

  use {
    'echasnovski/mini.nvim',
    config = function()
      require('configfiles.plugins.mini')
    end
  }

end)
