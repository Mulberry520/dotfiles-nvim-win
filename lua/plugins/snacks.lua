return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      win = {
        input = {
          keys = {
            ["<C-e>"] = { "cycle_win", mode = { "i", "n" } },
          },
        },
        list = {
          keys = {
            ["<C-e>"] = "cycle_win",
          },
        },
        preview = {
          keys = {
            ["<C-e>"] = "cycle_win",
          },
        },
      },
    },
  },
}
