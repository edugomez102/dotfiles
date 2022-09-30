
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

  use {
    'hrsh7th/nvim-cmp',
    requires = {
       'hrsh7th/cmp-nvim-lsp',
       'saadparwaiz1/cmp_luasnip',
       {
        'L3MON4D3/LuaSnip',
        config = function()
          require('configfiles.plugins.lsp.nvim-cmp')
        end
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

  -- Extra functions
  use 'tomtom/tcomment_vim'
  use 'jiangmiao/auto-pairs'
  use 'sickill/vim-pasta'
  use 'tpope/vim-surround'
  use 'junegunn/vim-easy-align'
  use 'AndrewRadev/splitjoin.vim'
  use 'myusuf3/numbers.vim'
  -- vim.cmd 'let g:numbers_exclude_buftype = [ "terminal" ] '

  use 'tpope/vim-eunuch'
  use 'mbbill/undotree'

  -- Git
  use 'tpope/vim-fugitive'
  use 'rhysd/git-messenger.vim'
  use 'rbong/vim-flog'
  use 'mhinz/vim-signify'
  vim.g.signify_sign_change = '~'

  use 'voldikss/vim-floaterm'
  vim.g.floaterm_wintype = 'split'
  vim.g.floaterm_height = 0.3

  use {
    'echasnovski/mini.nvim',
    config = function()
      require('configfiles.plugins.mini')
    end
  }

end)
