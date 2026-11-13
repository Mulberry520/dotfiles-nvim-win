-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set text display options
vim.opt.wrap = true
vim.opt.breakindent = true

-- Set terminal to pwsh
LazyVim.terminal.setup("pwsh")

-- Remap local leader
vim.g.maplocalleader = ","

-- Set spell file
local spell_dir = vim.fs.joinpath(vim.fn.stdpath("config"), "spell")
if vim.fn.isdirectory(spell_dir) == 0 then
  vim.fn.mkdir(spell_dir, "p")
end
vim.opt.spellfile = { vim.fs.joinpath(spell_dir, "en.utf-8.add") }
