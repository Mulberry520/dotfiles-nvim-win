return {
	"mfussenegger/nvim-jdtls",
	opts = function(_, opts)
		local java = require("custom.java")
		local version = java.get_java_version()
		local jdk_path = java.get_jdk_path(version)

		if not jdk_path then
			return
		end

		local runtime_path = java.get_runtime_path(version)
		if not runtime_path then
			return
		end

		opts.cmd = vim.list_extend(opts.cmd or {}, { "-vm", runtime_path })

		opts.settings = vim.tbl_deep_extend("force", opts.settings or {}, {
			java = {
				configuration = {
					runtimes = {
						{
							name = java.get_runtime_name(version),
							path = jdk_path,
							default = true,
						},
					},
				},
			},
		})

		vim.notify("Using JDK: " .. version, vim.log.levels.INFO)
	end,
}
