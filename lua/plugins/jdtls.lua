local java = require("custom.java")

return {
  -- Affected by LazyVim extra "lang.java"
  "mfussenegger/nvim-jdtls",
  opts = function(_, opts)
    opts.cmd = opts.cmd or { vim.fn.exepath("jdtls") }
    table.insert(opts.cmd, 2, "--java-executable")
    table.insert(opts.cmd, 3, java.get_exe_path(java.jdtls_min_jdk_ver))
    opts.settings = vim.tbl_deep_extend("force", opts.settings or {}, {
      java = {
        configuration = {
          runtimes = java.get_jdk_runtimes(),
        },
      },
    })
  end,
}
