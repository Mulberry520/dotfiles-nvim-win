return {
  -- Affected by LazyVim extra "lang.markdown"
  "iamcco/markdown-preview.nvim",
  init = function()
    vim.g.mkdp_page_title = "${name}.md"
    vim.g.mkdp_combine_preview = 1
    vim.g.mkdp_preview_options = {
      mkit = { breaks = true },
      katex = { strict = "warn", trust = true },
      maid = { theme = "neutral", useMaxWidth = false },
    }
  end,

  build = function(plugin)
    local yarn_path = vim.fn.exepath("yarn.cmd")
    if yarn_path == "" then
      vim.schedule(function()
        vim.notify("[markdown-preview] yarn is not installed", vim.log.levels.ERROR)
      end)
      return
    end

    local cmd = string.format('cd "%s"; & "%s" install', plugin.dir, yarn_path)
    local output = vim.fn.system(cmd)
    if vim.v.shell_error ~= 0 then
      vim.schedule(function()
        vim.notify("[markdown-preview] yarn install failed: " .. output, vim.log.levels.ERROR)
      end)
    end
  end,
}
