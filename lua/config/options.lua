-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.g.editorconfig = true

vim.opt.wrap = true
vim.opt.breakindent = true

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"lua",
		"vim",
		"xml",
		"yml",
		"vue",
		"css",
		"tsx",
		"jsx",
		"scss",
		"less",
		"yaml",
		"toml",
		"html",
		"json",
		"jsonc",
		"json5",
		"diff",
		"astro",
		"query",
		"ninja",
		"graphql",
		"markdown",
		"gitcommit",
		"git_config",
		"javascript",
		"typescript",
		"dockerfile",
	},
	callback = function()
		if vim.b.editorconfig_shiftwidth then
			return
		end
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true
	end,
})
