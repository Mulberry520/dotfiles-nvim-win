local indent4_markers = {
	"pom.xml",
	".mvn",
	"mvnw",
	"build.gradle",
	"build.gradle.kts",
	"settings.gradle",
	"settings.gradle",
	".classpath",
	".project",
}
local curr_path = vim.fn.expand("%:p:h")
local java_root = vim.fs.root(curr_path, indent4_markers)

if not java_root then
	require("custom.editor").set_indent_2_spaces()
end
