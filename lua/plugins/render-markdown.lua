return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	ft = { "markdown" },
	opts = {
		enabled = true,
		heading = {
			enabled = true,
			icons = {
				"██ ",
				"▊█ ",
				"▊▊█ ",
				"▊▊▊█ ",
				"▊▊▊▊█ ",
				"▊▊▊▊▊█ ",
			},
			position = "inline",
		},
		latex = {
			enabled = true,
			converter = { "latex2text", "pandoc" },
		},
	},
}
