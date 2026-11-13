return {
  -- Affected by LazyVim extra "lang.markdown"
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    heading = {
      icons = {
        "██ ",
        "▊█ ",
        "▊▊█ ",
        "▊▊▊█ ",
        "▊▊▊▊█ ",
        "▊▊▊▊▊█ ",
      },
      position = "inline",
    },
    latex = {
      converter = { "latex2text", "pandoc" },
    },
  },
}
