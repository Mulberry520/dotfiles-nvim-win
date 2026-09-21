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
	["24"] = home_jdk("temurin-24.0.2"),
	["25"] = home_jdk("temurin-25.0.4.1"),
	["26"] = home_jdk("temurin-26.0.2.1"),
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
			default = (ver == M.default_java_ver),
		})
	end
	return runtimes
end

----

local CURR_ROOT = nil

local function auto_set_jdk(bufnr)
	if not bufnr or not vim.api.nvim_buf_is_valid(bufnr) then
		return
	end
	local buf_name = vim.fn.bufname(bufnr)
	if buf_name == "" or buf_name:match("^%w+://") then
		return
	end

	local curr_path = vim.fn.fnamemodify(buf_name, ":p:h")
	if CURR_ROOT and vim.fs.relpath(CURR_ROOT, curr_path) then
		return
	end

	local proj_root = vim.fs.root(curr_path, M.root_marks)
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
		return
	end

	local ok1, jdtls = pcall(require, "jdtls")
	if ok1 and jdtls.set_runtime then
		vim.notify("Set jdtls runtimes: JavaSE-" .. ver_num, vim.log.levels.INFO)
		jdtls.set_runtime("JavaSE-" .. ver_num)
	end
	CURR_ROOT = proj_root
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

vim.api.nvim_create_user_command("JdtResetProjVer", function()
	CURR_ROOT = nil
	auto_set_jdk(vim.api.nvim_get_current_buf())
end, {})

return M
