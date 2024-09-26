local lsp_zero = require('lsp-zero')

local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'lua_ls', 'volar', 'gopls' }

local on_attach = function(_, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
end

lsp_zero.on_attach(on_attach)

local ft = require('guard.filetype')

ft('typescript,javascript,typescriptreact,html,yaml,vue'):fmt('prettier')

require("guard").setup {
  fmt_on_save = false,
  lsp_as_default_formatter = true,
}

vim.keymap.set('n', '<leader>fa', '<cmd>GuardFmt<CR>')
vim.keymap.set('n', '<leader>.', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename)

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup()
-- Ensure the servers above are installed
require('mason-lspconfig').setup {
  ensure_installed = servers,
  handlers = {
    lsp_zero.default_setup,
  }
}

require("mason-null-ls").setup({
    ensure_installed = { "eslint", "jq" }
})

local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.spell,
        require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
    },
})

-- Turn on status information
require('fidget').setup()

require('lspconfig').volar.setup {
  settings = {
    languageFeatures = {
      inlayHints = true
    }
  }
}

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  }, mapping = cmp.mapping.preset.insert {
  ['<C-k>'] = cmp.mapping.select_prev_item(),
  ['<C-j>'] = cmp.mapping.select_next_item(),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ['<Tab>'] = cmp_action.tab_complete(),
  ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
},
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
