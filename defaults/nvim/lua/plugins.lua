local ale_config        = require('plug-config.ale')
local completion_config = require('plug-config.completion-nvim')
local delimit_config    = require('plug-config.delimitMate')
local fzf_config        = require('plug-config.fzf')
local goyo_config       = require('plug-config.goyo')
local bufferline_config = require('plug-config.nvim-bufferline')
local colorizer_config  = require('plug-config.nvim-colorizer')
-- local lsp_config        = require('plug-config.nvim-lspconfig')
local treesitter_config = require('plug-config.nvim-treesitter')
local devicons_config   = require('plug-config.nvim-web-devicons')
local rust_config       = require('plug-config.rust')
local floaterm_config   = require('plug-config.vim-floaterm')
local localrc_config    = require('plug-config.vim-localvimrc')
local whichkey_config   = require('plug-config.vim-which-key')
local vimtex_config     = require('plug-config.vimtex')

vim.cmd('packadd packer.nvim')

return require('packer').startup(function()
  -- Let Packer manage itself as an optional plugin
  use { 'wbthomason/packer.nvim', opt=true }

  -- Lsp, completions and linting
  -- use { 'neovim/nvim-lspconfig',    config = lsp_config        }
  use { 'nvim-lua/completion-nvim', config = completion_config }
  use { 'dense-analysis/ale',       config = ale_config        }

  -- UI
  use { 'nvim-treesitter/nvim-treesitter', config = treesitter_config }
  use { 'norcalli/nvim-colorizer.lua',     config = colorizer_config  }
  use {
    'akinsho/nvim-bufferline.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
      config = devicons_config,
    },
    config   = bufferline_config;
  }

  -- Scripting and profiling
  use 'tpope/vim-scriptease'
  use { 'tweekmonster/startuptime.vim', cmd = 'StartupTime' }

  -- Ergonomics
  use { 'Raimondi/delimitMate', config = delimit_config }
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'

  -- File navigation
  use {
    'junegunn/fzf.vim',
    requires = { 'junegunn/fzf' },
    config   = fzf_config,
  }

  -- Filetype specific
  use { 'rust-lang/rust.vim', ft = 'rust', config = rust_config   }
  use { 'lervag/vimtex',      ft = 'tex',  config = vimtex_config }

  -- Misc
  use { 'liuchengxu/vim-which-key', config = whichkey_config }
  use { 'voldikss/vim-floaterm',    config = floaterm_config }
  use { 'embear/vim-localvimrc',    config = localrc_config }
  use 'farmergreg/vim-lastplace'
  use 'timakro/vim-searchant'
  use { 'junegunn/goyo.vim',  cmd = 'Goyo', config = goyo_config }
  use { 'qpkorr/vim-bufkill', cmd = 'BD' }
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    cmd = 'MarkdownPreview',
  }

  -- Colorschemes
  use 'danilo-augusto/vim-afterglow'
  use 'morhetz/gruvbox'
  use 'joshdick/onedark.vim'

end)
