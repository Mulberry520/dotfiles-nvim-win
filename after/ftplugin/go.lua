-- Go uses hard tabs; display and shift them as 4 columns.
local ec = vim.b.editorconfig
if ec and (ec.indent_size or ec.indent_style or ec.tab_width) then
  return
end

vim.opt_local.expandtab = false
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 0
