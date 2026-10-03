return {
	"max397574/better-escape.nvim",
	event = "InsertEnter",
	opts = {
		timeout = vim.o.timeoutlen,
		mappings = {
			i = { j = { j = false } },
			t = { j = { k = "<C-\\><C-n>" } },
		},
	},
}
