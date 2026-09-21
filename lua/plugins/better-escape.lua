return {
	"max397574/better-escape.nvim",
	event = "InsertEnter",
	opts = {
		timeout = vim.o.timeoutlen,
		mappings = {
			i = { j = { k = "<Esc>" } },
			v = { j = { k = "<Esc>" } },
			t = { j = { k = "<C-\\><C-n>" } },
		},
	},
}
