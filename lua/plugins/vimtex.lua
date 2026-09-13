return {
	"lervag/vimtex",
	lazy = true,
	ft = "tex",
	init = function()
		vim.g.vimtex_view_general_viewer = "C:\\tools\\QuickStart\\sumatra.bat"
		vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
	end,
}
