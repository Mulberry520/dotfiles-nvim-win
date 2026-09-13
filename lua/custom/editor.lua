local M = {}

function M.set_indent_2_spaces()
	if vim.b.editorconfig_shiftwidth then
		return
	end

	vim.opt_local.shiftwidth = 2
	vim.opt_local.tabstop = 2
	vim.opt_local.softtabstop = 2
	vim.opt_local.expandtab = true
end

return M
