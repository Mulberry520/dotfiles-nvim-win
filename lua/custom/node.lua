local M = {}

M.node_map = {
	["16"] = "C:/js/nvm/v16.16.0/node.exe",
	["18"] = "C:/js/nvm/v18.20.4/node.exe",
	["20"] = "C:/js/nvm/v20.18.1/node.exe",
	["22"] = "C:/js/nvm/v22.20.0/node.exe",
}

M.default_node_version = "22"

function M.get_node_dir(node_version)
	local version = tostring(node_version)

	local node_dir = M.node_map[version]
	if node_dir then
		return node_dir
	end

	node_dir = M.node_map[M.default_node_version]
	if node_dir then
		vim.notify("Using default node for version: " .. M.default_node_version, vim.log.levels.WARN)
		return node_dir
	end

	vim.notify("No node found for version: " .. node_version, vim.log.levels.ERROR)
	return nil
end

function M.get_node_path(node_version)
	local node_dir = M.get_node_dir(node_version)
	if node_dir then
		return vim.fs.joinpath(node_dir, "node.exe")
	end

	return nil
end

function M.get_npm_path(node_version)
	local node_dir = M.get_node_dir(node_version)
	if node_dir then
		return vim.fs.joinpath(node_dir, "npm.cmd")
	end

	return nil
end

return M
