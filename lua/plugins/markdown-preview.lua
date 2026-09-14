local utils = require("custom/utils")

return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },

	build = function()
		local npm = vim.fn.executable("npm.cmd") == 1 and "npm.cmd" or vim.fn.executable("npm") == 1 and "npm" or nil
		if not npm then
			vim.schedule(function()
				vim.notify("[markdown-preview] npm not found, skipping build", vim.log.levels.ERROR)
			end)
			return
		end

		local plugin_dir = utils.get_plugin_dir("markdown-preview.nvim")
		local exclude_file = vim.fs.joinpath(plugin_dir, ".git", "info", "exclude")
		local f = io.open(exclude_file, "a")
		if f then
			f:write("\nyarn.lock\n")
			f:close()
		end

		local cmd = string.format('cd /d "%s" && %s install', plugin_dir, npm)
		vim.fn.system(cmd)
	end,

	config = function()
		vim.g.mkdp_highlight_current_line = 1
	end,
}
