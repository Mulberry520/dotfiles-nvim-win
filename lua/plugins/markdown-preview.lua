return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },

	build = function(plugin)
		local yarn_path = vim.fn.exepath("yarn.cmd")
		if yarn_path == "" then
			vim.schedule(function()
				vim.notify("[markdown-preview] yarn is not installed", vim.log.levels.ERROR)
			end)
			return
		end

		local cmd = string.format('cd "%s"; & "%s" install', plugin.dir, yarn_path)
		local output = vim.fn.system(cmd)
		if vim.v.shell_error ~= 0 then
			vim.schedule(function()
				vim.notify("[markdown-preview] yarn install failed: " .. output, vim.log.levels.ERROR)
			end)
		end
	end,

	config = function()
		vim.g.mkdp_highlight_current_line = 1
	end,
}
