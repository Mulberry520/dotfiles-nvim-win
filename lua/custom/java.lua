local M = {}

local function home_jdk(ver_name)
	return vim.fs.joinpath(vim.env.USERPROFILE, ".jdks", ver_name)
end

M.jdk_map = {
	["temurin-17"] = home_jdk("temurin-17.0.16"),
	["temurin-18"] = home_jdk("temurin-18.0.2.1"),
	["temurin-19"] = home_jdk("temurin-19.0.2"),
	["temurin-20"] = home_jdk("temurin-20.0.2"),
	["temurin-21"] = home_jdk("temurin-21.0.12.1"),
	["temurin-22"] = home_jdk("temurin-22.0.2"),
	["temurin-23"] = home_jdk("temurin-23.0.2"),
	["temurin-24"] = home_jdk("temurin-24.0.2"),
	["temurin-25"] = home_jdk("temurin-25.0.4.1"),
	["temurin-26"] = home_jdk("temurin-26.0.2.1"),
	["ms-11"] = home_jdk("ms-11.0.32.1"),
	["ms-21"] = home_jdk("ms-21.0.12.1"),
	["openjdk-21"] = "C:/java/openjdk-21/",
}

M.default_version = "21"
M.default_jdk_name = "temurin-21"
M.default_ver_file = ".java-version"

local version_cache = {}
local group = vim.api.nvim_create_augroup("JdtAutoVer", { clear = true })

local function find_jdk_name(ver_num)
	for name, _ in pairs(M.jdk_map) do
		if name:find(ver_num, 1, true) then
			return name
		end
	end

	return nil
end

local function find_proj_root(curr_path)
	return vim.fs.root(curr_path, {
		".mvn",
		".git",
		"build.gradle",
		M.default_ver_file,
		"pom.xml",
	})
end

local function set_runtime_jdk(bufnr)
	local buf_path = vim.fn.bufname(bufnr)
	if buf_path == "" then
		return
	end
	buf_path = vim.fn.fnamemodify(buf_path, ":p:h")

	for root, jdk_name in pairs(version_cache) do
		if buf_path:sub(1, #root) == root then
			local ok, jdtls = pcall(require, "jdtls")
			if ok and jdtls.set_runtime then
				vim.notify("set runtime jdk: " .. jdk_name)
				jdtls.set_runtime(jdk_name)
			end
			return
		end
	end

	local proj_root = find_proj_root(buf_path)
	if not proj_root then
		return
	end
	local ver_file = vim.fs.joinpath(proj_root, M.default_ver_file)
	local ok, lines = pcall(vim.fn.readfile, ver_file)
	if not ok or #lines == 0 then
		return
	end

	local ver_num = (lines[1] or ""):match("(%d+)")
	if not ver_num then
		return
	end
	local jdk_name = find_jdk_name(ver_num)
	if not jdk_name then
		return
	end

	version_cache[proj_root] = jdk_name
	local ok1, jdtls = pcall(require, "jdtls")
	if ok1 and jdtls.set_runtime then
		vim.notify("Set runtime jdk: " .. jdk_name)
		jdtls.set_runtime(jdk_name)
	end
end

vim.api.nvim_create_autocmd("LspAttach", {
	group = group,
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client or client.name ~= "jdtls" then
			return
		end
		set_runtime_jdk(args.buf)
	end,
})

vim.api.nvim_create_user_command("JdtClearVer", function()
	version_cache = {}
end, {})

return M
