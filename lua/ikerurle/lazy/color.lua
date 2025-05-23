function SetColorscheme(color)
  color = color or "catppuccin"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = 'gray' })
  vim.api.nvim_set_hl(0, 'LineNr', { fg = 'white' })
  vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = 'gray' })
end

return {
  {
    "navarasu/onedark.nvim",
    config = function()
      -- SetColorscheme("onedark")
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      SetColorscheme("catppuccin")
    end
  },
}
