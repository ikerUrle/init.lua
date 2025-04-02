return {
  {
    'theprimeagen/harpoon',
    config = function()
      local mark = require('harpoon.mark')
      local ui = require('harpoon.ui')

      vim.keymap.set("n", "<leader>a", mark.add_file)
      -- vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)

      vim.keymap.set('n', '<leader>h', '<cmd>lua require("harpoon.ui").nav_file(vim.v.count1)<cr>')
    end
  }
}
