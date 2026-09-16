local java = require("custom.java")

return {
	"mfussenegger/nvim-jdtls",
	ft = "java",
	config = function()
		require("jdtls").start_or_attach({
			cmd = {
				"jdtls",
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
}
