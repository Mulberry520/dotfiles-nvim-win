local M = {}

function M.set_indent_4_spaces()
  local ec = vim.b.editorconfig
  if ec and (ec.indent_size or ec.indent_style or ec.tab_width) then
    return
  end

  vim.opt_local.shiftwidth = 4
  vim.opt_local.tabstop = 4
  vim.opt_local.softtabstop = 4
end

return M
