-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- set wrap and breakindent for all filetypes
vim.opt.wrap = true
vim.opt.breakindent = true

-- set shell to pwsh for Windows
vim.opt.shell = "pwsh"
vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
vim.opt.shellquote = ""
vim.opt.shellxquote = ""
vim.opt.shellpipe = "| %s"
vim.opt.shellxescape = '&|<>()@^"% ,;=`'

-- remap local leader
vim.g.maplocalleader = ","

-- set spell file
--local spell_dir = vim.fs.joinpath(vim.fn.stdpath("config"), "spell")
local spell_dir = vim.fs.joinpath(vim.env.USERPROFILE, "AppData/Local/nvim/spell")
if vim.fn.isdirectory(spell_dir) == 0 then
	vim.fn.mkdir(spell_dir, "p")
end
vim.opt.spellfile = { vim.fs.joinpath(spell_dir, "en.utf-8.add") }
