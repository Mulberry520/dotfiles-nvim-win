-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Force the English US keyboard layout (LCID 1033) whenever Neovim is in Normal mode;
-- im-select.exe is installed via scoop and resolved from PATH; jobstart is async.
local im_select = vim.fn.exepath("im-select.exe")
if im_select == "" then
	return
end

local function switch_to_english()
	if vim.fn.mode() == "n" then
		vim.fn.jobstart({ im_select, "1033" })
	end
end

vim.api.nvim_create_autocmd("ModeChanged", {
	pattern = "[iRtc]*:n*",
	callback = switch_to_english,
})

vim.api.nvim_create_autocmd({ "WinEnter", "FocusGained" }, {
	callback = switch_to_english,
})

switch_to_english()
