return {
	-- Affected by LazyVim extras: "coding.blink", "ai.copilot", "copilot", "lang.sql"
	"saghen/blink.cmp",
	opts = {
		keymap = {
			["<C-y>"] = false,
			["<Tab>"] = {
				function(cmp)
					if cmp.snippet_active() then
						return cmp.accept()
					end
					return cmp.select_next()
				end,
				"snippet_forward",
				"fallback",
			},
		},
		sources = {
			per_filetype = {
				markdown = { "snippets", "buffer" },
				txt = { "path", "buffer" },
			},
			providers = {
				-- LSP items first; Copilot takes over when LSP returns nothing.
				lsp = { score_offset = 200 },
				copilot = { score_offset = 100 },
			},
		},
		cmdline = {
			sources = { "cmdline", "path" },
		},
	},
}
