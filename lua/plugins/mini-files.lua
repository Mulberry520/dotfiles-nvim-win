return {
  -- Affected by LazyVim extra "editor.mini-files"
  "nvim-mini/mini.files",
  keys = {
    {
      "<leader>fM",
      function()
        local root = LazyVim.root.get()
        require("mini.files").open(root or vim.uv.cwd(), false)
      end,
      desc = "Open mini.files (Project Root or cwd)",
    },
  },
}
