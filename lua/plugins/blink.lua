return {
	"saghen/blink.cmp",
	dependencies = {
		"zbirenbaum/copilot.lua",
		"fang2hou/blink-copilot",
	},
	opts = {
		keymap = {
			preset = "default",
			["<C-y>"] = false,
			["<CR>"] = { "select_and_accept", "fallback" },
			["<Tab>"] = {
				function(cmp)
					if cmp.snippet_active() then
						return cmp.accept()
					else
						return cmp.select_next()
					end
				end,
				"snippet_forward",
				"fallback",
			},
			["<S-Tab>"] = {
				function(cmp)
					if cmp.snippet_active() then
						return cmp.snippet_backward()
					end
				end,
				"fallback",
			},
		},
		sources = {
			default = { "lsp", "copilot", "snippets", "path", "buffer" },
			per_filetype = {
				markdown = { "snippets", "buffer" },
				txt = { "path", "buffer" },
			},
			providers = {
				copilot = {
					name = "copilot",
					module = "blink-copilot",
					score_offset = -2,
					async = true,
				},
			},
		},
		cmdline = {
			enabled = true,
			sources = { "cmdline", "path" },
		},
	},
}
