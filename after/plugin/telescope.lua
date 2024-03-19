local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>p', builtin.find_files, { desc = 'Find files' })
-- vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = 'Search [H]elp' })
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>ff', builtin.live_grep, { desc = '[F]uzzy [F]ind' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>l', builtin.resume, { desc = 'Repeat [L]ast action' })

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
local telescope_actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ['<C-j>'] = telescope_actions.move_selection_next,
        ['<C-k>'] = telescope_actions.move_selection_previous,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
