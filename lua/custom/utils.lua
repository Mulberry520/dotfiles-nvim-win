local M = {}

function M.get_plugin_dir(plugin_name)
	local lazy_config = require("lazy.core.config")
	return lazy_config.plugins[plugin_name] and lazy_config.plugins[plugin_name].dir or nil
end

return M
