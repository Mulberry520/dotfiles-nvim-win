local paths = require("custom.paths")

local M = {}

-- Jdtls version greater than 1.63.0
M.jdtls_min_jdk_ver = "25"

M.default_java_ver = "21"

function M.get_exe_path(ver)
  return vim.fs.joinpath(paths.jdk_dirs[ver], "bin", "java.exe")
end

function M.get_jdk_runtimes()
  local runtimes = {}
  for ver, path in pairs(paths.jdk_dirs) do
    table.insert(runtimes, {
      name = "JavaSE-" .. ver,
      path = path,
      default = (ver == M.default_java_ver),
    })
  end
  return runtimes
end

return M
