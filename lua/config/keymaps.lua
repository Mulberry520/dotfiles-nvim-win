-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Map ctrl+j to enter a new line in terminal mode
vim.api.nvim_create_autocmd("TermEnter", {
  callback = function(args)
    vim.keymap.set("t", "<C-j>", "<NL>", { buffer = args.buf })
  end,
})
