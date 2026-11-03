return {
	-- Avante is disabled for now: on Windows, the sandbox makes avante's
	-- readfile/writefile (and similar file tools) unavailable.
	-- After the author fixes it: remove this entry, enable the `ai.avante`
	-- extra, and it can be used again.
	-- If several AI plugins are enabled, adjust keymaps to avoid conflicts.
	{ "yetone/avante.nvim", enabled = false },
}
