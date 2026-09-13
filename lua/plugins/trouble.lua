return {
	"folke/trouble.nvim",
	opts = {
		auto_close = true,
		auto_preview = true,
		preview = { type = "main" },
		focus = true,
		icons = {
			indent = { top = "│ ", last = "└─" },
		},
		modes = {
			diagnostics = {
				desc = "Diagnostics",
				filter = { buf = 0 },
			},
			lsp_references = {
				desc = "LSP References",
				params = { include_declaration = false },
			},
			symbols = {
				desc = "Document Symbols",
				filter = { kind = { "Class", "Function", "Method", "Interface", "Module" } },
			},
		},
	},
	keys = {
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
		{ "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics" },

		{ "gr", "<cmd>Trouble lsp_references toggle<cr>", desc = "LSP References" },
		{ "gd", "<cmd>Trouble lsp_definitions toggle<cr>", desc = "LSP Definitions" },
		{ "gi", "<cmd>Trouble lsp_implementations toggle<cr>", desc = "LSP Implementations" },

		{ "<leader>cs", "<cmd>Trouble symbols toggle<cr>", desc = "Symbols Outline" },

		{ "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List" },
		{ "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location List" },
	},
}
