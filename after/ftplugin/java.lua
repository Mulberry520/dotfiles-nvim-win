vim.opt_local.spell = true
vim.opt_local.spelllang = { "en", "cjk" }
vim.opt_local.spelloptions:append("camel")

require("custom.editor").set_indent_4_spaces()
