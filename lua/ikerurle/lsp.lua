local ft = require('guard.filetype')

ft('typescript,javascript,typescriptreact,html,yaml,vue'):fmt('prettier'):lint('eslint')

require("guard").setup {
  fmt_on_save = false,
  lsp_as_default_formatter = true,
}
