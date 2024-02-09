local ft = require('guard.filetype')

ft('typescript,javascript,typescriptreact,html,yaml,vue'):fmt('prettierd')

require("guard").setup {
  fmt_on_save = false,
  lsp_as_default_formatter = true,
}
