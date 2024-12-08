local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

  'nvim-lua/plenary.nvim',

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/nvim-cmp',
      'L3MON4D3/LuaSnip',
      'j-hui/fidget.nvim',
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
      "nvimtools/none-ls-extras.nvim"
    },
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
    }
  },

  {
    "nvimdev/guard.nvim",
    -- Builtin configuration, optional
    dependencies = {
      "nvimdev/guard-collection",
    },
  },
  { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
  },

  { -- HTML autotags
    'windwp/nvim-ts-autotag',
  },

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
      }
    end
  },

  { "catppuccin/nvim",                          name = "catppuccin" },

  {
    'nvim-lualine/lualine.nvim', -- Fancier statusline
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = false,
          theme = 'auto',
          component_separators = '|',
          section_separators = '',
        },
      }
    end
  },
  {
    'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
    config = function() require('ibl').setup {} end
  },
  {
    'numToStr/Comment.nvim',
    config = function() require("Comment").setup {} end
  },                  -- "gc" to comment visual regions/lines
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  },

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- Fuzzy Finder Algorithm which dependencies local dependencies to be built. Only load if `make` is available
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make',     cond = vim.fn.executable 'make' == 1 },
  {
    'nvim-tree/nvim-web-devicons',
    config = function() require("nvim-web-devicons").setup {} end
  },

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
    config = function()
      require("nvim-tree").setup {
        view = {
          width = {} -- dynamic width
        },
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
        filters = {
          dotfiles = false
        }
      }
    end
  },


  {
    "folke/trouble.nvim", -- List lsp errors
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  },

  {
    'nvim-pack/nvim-spectre', -- Search & replace
    config = function()
      require("spectre").setup {}
    end
  },
  {
    'mfussenegger/nvim-dap'
  },
  'theprimeagen/harpoon',
  'github/copilot.vim',
  {
  'stevearc/aerial.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
  },
}
})
