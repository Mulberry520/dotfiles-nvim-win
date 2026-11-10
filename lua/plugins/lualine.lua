return {
	"nvim-lualine/lualine.nvim",
	opts = function(_, opts)
		opts.sections.lualine_a[1] = {
			"mode",
			fmt = function(str)
				if vim.fn.reg_recording() ~= "" then
					return "MACRO"
				end
				return str
			end,
		}
	end,
	config = function(_, opts)
		require("lualine").setup(opts)
		local highlight = require("lualine.highlight")

		if type(highlight.get_mode_suffix) == "function" then
			local origin_mode_suffix = highlight.get_mode_suffix
			---@diagnostic disable-next-line: duplicate-set-field
			highlight.get_mode_suffix = function()
				if vim.fn.reg_recording() ~= "" then
					return "_replace"
				end
				return origin_mode_suffix()
			end
		end

		vim.api.nvim_create_autocmd({ "RecordingEnter", "RecordingLeave" }, {
			group = vim.api.nvim_create_augroup("lualine_macro_recording", { clear = true }),
			callback = function()
				require("lualine").refresh()
			end,
		})
	end,
}
