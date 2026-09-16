local java = require("custom.java")
local lombok_jar = vim.fs.joinpath(vim.fn.stdpath("data"), "mason/packages/jdtls/lombok.jar")

return {
	"mfussenegger/nvim-jdtls",
	ft = "java",

	config = function()
		local runtimes = {}
		for name, path in pairs(java.jdk_map) do
			table.insert(runtimes, {
				name = name,
				path = path,
				default = (name == java.default_jdk_name),
			})
		end

		local config = {
			cmd = {
				"jdtls",
				"--jvm-arg=-javaagent:" .. lombok_jar,
			},
			root_markers = { "pom.xml" },
			settings = {
				java = {
					configuration = {
						runtimes = runtimes,
						maven = { enabled = true },
					},
					lombok = { enabled = true },
					autobuild = { enabled = true },
				},
			},
		}
		require("jdtls").start_or_attach(config)
	end,
}
