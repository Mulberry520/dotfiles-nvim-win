return {
	{
		"folke/trouble.nvim",
		opts = {
			auto_close = true,
			focus = true,
			icons = {
				indent = { last = "└─" },
			},
			modes = {
				diagnostics = {
					desc = "Diagnostics",
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
	},
	{
		-- Override LazyVim's buffer-local gd/gr/gI picker mappings with Trouble.
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				["*"] = {
					keys = {
						{ "gd", "<cmd>Trouble lsp_definitions toggle<cr>", desc = "LSP Definitions" },
						{ "gr", "<cmd>Trouble lsp_references toggle<cr>", desc = "LSP References", nowait = true },
						{ "gI", "<cmd>Trouble lsp_implementations toggle<cr>", desc = "LSP Implementations" },
					},
				},
			},
		},
	},
}
