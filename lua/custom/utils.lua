local M = {}

function M.get_plugin_dir(plugin_name)
	local ok, lazy = pcall(require, "lazy.core.config")
	if not ok or type(lazy.plugins) ~= "table" then
		return vim.fs.joinpath(vim.fn.stdpath("data"), "lazy", plugin_name)
	end

	for _, spec in ipairs(lazy.plugins) do
		if spec.name == plugin_name then
			return spec.dir
		end
	end

	return vim.fs.joinpath(vim.fn.stdpath("data"), "lazy", plugin_name)
end

return M
