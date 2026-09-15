local java = require("custom.java")

return {
	"mfussenegger/nvim-jdtls",
	ft = "java",
	config = function()
		local runtimes = {}
		for name, path in pairs(java.jdk_name_map) do
			table.insert(runtimes, {
				name = name,
				path = path,
				default = (name == java.default_jdk),
			})
		end

		local jdtls = require("jdtls")
		jdtls.start_or_attach({
			cmd = { "jdtls" },
			settings = {
				java = {
					configuration = {
						runtimes = runtimes,
					},
				},
			},
		})
	end,
}
