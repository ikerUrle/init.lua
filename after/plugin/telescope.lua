local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>p', builtin.find_files, { desc = 'Find files' })
-- vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = 'Search [H]elp' })
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>ff', builtin.live_grep, { desc = '[F]uzzy [F]ind' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>l', builtin.resume, { desc = 'Repeat [L]ast action' })
