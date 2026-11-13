return {
  "keaising/im-select.nvim",
  event = "VeryLazy",
  opts = {
    default_im_select = "1033",
    default_command = "im-select.exe",
    set_default_events = { "InsertLeave", "CmdlineLeave", "WinEnter", "FocusGained" },
  },
  config = function(_, opts)
    require("im_select").setup(opts)
    if vim.fn.exepath(opts.default_command) ~= "" then
      vim.fn.jobstart({ opts.default_command, opts.default_im_select })
    end
  end,
}
