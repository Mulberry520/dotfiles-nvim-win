return {
  -- Affected by LazyVim extras: "coding.blink", "lang.sql"
  "saghen/blink.cmp",
  opts = {
    keymap = {
      ["<C-y>"] = false,
      ["<Tab>"] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          end
          return cmp.select_next()
        end,
        "snippet_forward",
        "fallback",
      },
    },
    sources = {
      per_filetype = {
        markdown = { "path", "snippets", "buffer" },
        txt = { "path", "buffer" },
      },
      providers = {
        lsp = { score_offset = 200 },
      },
    },
    cmdline = {
      sources = { "cmdline", "path" },
    },
  },
}
