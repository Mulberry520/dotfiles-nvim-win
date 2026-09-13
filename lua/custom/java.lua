local M = {}

local jdk_home = vim.fs.joinpath(vim.env.USERPROFILE or "", ".jdks")

M.jdk_map = {
	["17"] = vim.fs.joinpath(jdk_home, "temurin-17.0.16"),
	["18"] = vim.fs.joinpath(jdk_home, "temurin-18.0.2.1"),
	["19"] = vim.fs.joinpath(jdk_home, "temurin-19.0.2"),
	["20"] = vim.fs.joinpath(jdk_home, "temurin-20.0.2"),
	["21"] = vim.fs.joinpath(jdk_home, "temurin-21.0.12.1"),
	["22"] = vim.fs.joinpath(jdk_home, "temurin-22.0.2"),
	["23"] = vim.fs.joinpath(jdk_home, "temurin-23.0.2"),
	["24"] = vim.fs.joinpath(jdk_home, "temurin-24.0.2"),
	["25"] = vim.fs.joinpath(jdk_home, "temurin-25.0.4.1"),
	["26"] = vim.fs.joinpath(jdk_home, "temurin-26.0.2.1"),
}

M.default_java_version = "21"

function M.get_java_version()
	local file = vim.fn.findfile(".java-version", ".;")
	if file ~= "" then
		local lines = vim.fn.readfile(file)
		local version = lines[1] and lines[1]:match("%d+")
		if version then
			return version
		end
	end

	vim.notify(
		"File .java-version not exist or unreadable, using default Java version: " .. M.default_java_version,
		vim.log.levels.INFO
	)
	return M.default_java_version
end

function M.get_jdk_path(java_version)
	local version = java_version or M.get_java_version()

	local jdk_path = M.jdk_map[version]
	if jdk_path then
		return jdk_path
	end

	vim.notify("No JDK path found for Java version: " .. version, vim.log.levels.ERROR)
	return nil
end

function M.get_runtime_name(java_version)
	local version = java_version or M.get_java_version()
	return "JavaSE-" .. version
end

function M.get_runtime_path(java_version)
	local version = java_version or M.get_java_version()

	local jdk_path = M.get_jdk_path(version)
	if not jdk_path then
		return nil
	end

	local bin = vim.fn.has("win32") == 1 and "java.exe" or "java"
	return jdk_path .. "/bin/" .. bin
end

return M
