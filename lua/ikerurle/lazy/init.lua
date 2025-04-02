return {
  'nvim-lua/plenary.nvim',

  {
    "nvimdev/guard.nvim",
    -- Builtin configuration, optional
    dependencies = {
      "nvimdev/guard-collection",
    },
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

  {
    'nvim-tree/nvim-web-devicons',
    config = function() require("nvim-web-devicons").setup {} end
  },

  {
    "folke/trouble.nvim", -- List lsp errors
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  },

  -- 'github/copilot.vim',
}
