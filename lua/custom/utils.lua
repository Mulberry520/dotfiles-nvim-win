local M = {}

function M.get_plugin_dir(plugin_name)
	local lazy_config = require("lazy.core.config")

	local plugin = lazy_config.plugins[plugin_name]
	if not plugin then
		vim.notify("Lazy plugin not found: " .. plugin_name, vim.log.levels.ERROR)
		return nil
	end

	return plugin.dir
end

return M
