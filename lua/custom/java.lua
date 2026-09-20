local M = {}

local function home_jdk(java_ver)
	return vim.fs.joinpath(vim.env.USERPROFILE, ".jdks", java_ver)
end

M.default_java_ver = "21"
M.default_ver_file = ".java-version"
M.jdtls_lombok_jar = vim.fs.joinpath(vim.fn.stdpath("data"), "mason/packages/jdtls/lombok.jar")

M.jdk_map = {
	["17"] = home_jdk("temurin-17.0.16"),
	["18"] = home_jdk("temurin-18.0.2.1"),
	["19"] = home_jdk("temurin-19.0.2"),
	["20"] = home_jdk("temurin-20.0.2"),
	["21"] = home_jdk("temurin-21.0.12.1"),
	["22"] = home_jdk("temurin-22.0.2"),
	["23"] = home_jdk("temurin-23.0.2"),
	["temurin-24"] = home_jdk("temurin-24.0.2"),
	["temurin-25"] = home_jdk("temurin-25.0.4.1"),
	["temurin-26"] = home_jdk("temurin-26.0.2.1"),
}

M.root_marks = {
	".mvn",
	"mvnw",
	"build.gradle",
	"settings.gradle",
	M.default_ver_file,
	"pom.xml",
	".git",
}

function M.get_jdk_runtimes()
	local runtimes = {}
	for ver, path in pairs(M.jdk_map) do
		table.insert(runtimes, {
			name = "JavaSE-" .. ver,
			path = path,
			default = (ver == M.default_jdk_name),
		})
	end
	return runtimes
end

local ver_cache = {}

local function jdt_set_runtime(jdk_ver)
	local ok, jdtls = pcall(require, "jdtls")
	if ok and jdtls.set_runtime then
		vim.notify("Set jdtls runtimes: JavaSE-" .. jdk_ver, vim.log.levels.INFO)
		jdtls.set_runtime("JavaSE-" .. jdk_ver)
	end
end

local function auto_set_jdk(bufnr)
	local buf_name = vim.fn.bufname(bufnr)
	if buf_name == "" then
		return
	end

	local buf_path = vim.fn.fnamemodify(buf_name, ":p:h")
	for root, jdk_ver in pairs(ver_cache) do
		if buf_path:sub(1, #root) == root then
			local ch = buf_path:sub(#root + 1, #root + 1)
			if ch == "" or ch == "/" then
				jdt_set_runtime(jdk_ver)
				return
			end
		end
	end

	local proj_root = vim.fs.root(buf_path, M.root_marks)
	if not proj_root then
		return
	end
	local ver_file = vim.fs.joinpath(proj_root, M.default_ver_file)
	local ok, lines = pcall(vim.fn.readfile, ver_file)
	if not ok or #lines == 0 then
		return
	end

	local ver_num = (lines[1] or ""):match("(%d+)")
	if not ver_num or not M.jdk_map[ver_num] then
		vim.notify("Not supported java version: " .. ver_num, vim.log.levels.ERROR)
		return
	end

	ver_cache[proj_root] = ver_num
	jdt_set_runtime(ver_num)
end

local group = vim.api.nvim_create_augroup("JdtAutoVer", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
	group = group,
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client or client.name ~= "jdtls" then
			return
		end
		auto_set_jdk(args.buf)
	end,
})

vim.api.nvim_create_user_command("JdtClearVerCache", function()
	ver_cache = {}
	vim.notify("Java version cache cleared", vim.log.levels.INFO)
end, {})

return M
