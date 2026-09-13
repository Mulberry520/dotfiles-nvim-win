local utils = require("custom/utils")

return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = function()
		if vim.fn.executable("npm") == 0 then
			vim.notify("[markdown-preview] npm not found, skipping build", vim.log.levels.WARN)
			return
		end
		local plugin_dir = utils.get_plugin_dir("markdown-preview.nvim")
		vim.fn.system({ "npm", "install", "--prefix", plugin_dir })
	end,
	config = function()
		vim.g.mkdp_highlight_current_line = 1
	end,
}
