local M = {}

function M.home_jdk(ver_name)
	return vim.fs.joinpath(vim.env.USERPROFILE, ".jdks", ver_name)
end

M.java_version_map = {
	["11"] = M.home_jdk("ms-11.0.32.1"),
	["17"] = M.home_jdk("temurin-17.0.16"),
	["18"] = M.home_jdk("temurin-18.0.2.1"),
	["19"] = M.home_jdk("temurin-19.0.2"),
	["20"] = M.home_jdk("temurin-20.0.2"),
	["21"] = M.home_jdk("temurin-21.0.12.1"),
	["22"] = M.home_jdk("temurin-22.0.2"),
	["23"] = M.home_jdk("temurin-23.0.2"),
	["24"] = M.home_jdk("temurin-24.0.2"),
	["25"] = M.home_jdk("temurin-25.0.4.1"),
	["26"] = M.home_jdk("temurin-26.0.2.1"),
}

M.jdk_name_map = {
	["temurin-17"] = M.home_jdk("temurin-17.0.16"),
	["temurin-18"] = M.home_jdk("temurin-18.0.2.1"),
	["temurin-19"] = M.home_jdk("temurin-19.0.2"),
	["temurin-20"] = M.home_jdk("temurin-20.0.2"),
	["temurin-21"] = M.home_jdk("temurin-21.0.12.1"),
	["temurin-22"] = M.home_jdk("temurin-22.0.2"),
	["temurin-23"] = M.home_jdk("temurin-23.0.2"),
	["temurin-24"] = M.home_jdk("temurin-24.0.2"),
	["temurin-25"] = M.home_jdk("temurin-25.0.4.1"),
	["temurin-26"] = M.home_jdk("temurin-26.0.2.1"),
	["ms-11"] = M.home_jdk("ms-11.0.32.1"),
	["ms-21"] = M.home_jdk("ms-21.0.12.1"),
	["openjdk-21"] = "C:/java/openjdk-21/",
}

M.default_version = "21"
M.default_jdk = "temurin-21"

return M
