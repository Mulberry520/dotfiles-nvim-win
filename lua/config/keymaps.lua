-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_create_autocmd("TermEnter", {
	callback = function(args)
		vim.keymap.set("t", "<C-j>", "<CR>", {
			buffer = args.buf,
			desc = "Terminal: make Ctrl + j = enter",
		})
	end,
})
