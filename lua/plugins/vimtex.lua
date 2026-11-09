local paths = require("custom.paths")

return {
	-- Affected by LazyVim extra "lang.tex"
	"lervag/vimtex",
	-- Commenting the two lines below to enable inverse search
	lazy = true,
	ft = "tex",
	init = function()
		vim.g.vimtex_view_general_viewer = paths.sumatrapdf
		vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
	end,
}
