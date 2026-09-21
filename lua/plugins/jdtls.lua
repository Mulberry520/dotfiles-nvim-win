local java = require("custom.java")

return {
	"mfussenegger/nvim-jdtls",
	event = "VeryLazy",
	config = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "java",
			callback = function()
				require("jdtls").start_or_attach({
					cmd = {
						"jdtls",
						"-vm",
						java.jdk_map[java.default_java_ver],
						"--jvm-arg=-javaagent:" .. java.jdtls_lombok_jar,
					},
					root_markers = java.root_marks,
					settings = {
						java = {
							configuration = {
								runtimes = java.get_jdk_runtimes(),
								maven = { enabled = true },
							},
							lombok = { enabled = true },
							autobuild = { enabled = true },
						},
					},
				})
			end,
		})
	end,
}
