return {
	{
		"yetone/avante.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"HakonHarnes/img-clip.nvim",
			"MeanderingProgrammer/render-markdown.nvim",
		},
		build = "pwsh -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false",
		opts = {
			provider = "deepseek",
			mode = "legacy",
			behaviour = {
				auto_suggestions = false,
				use_cwd_as_project_root = true,
			},
			providers = {
				deepseek = {
					__inherited_from = "openai",
					api_key_name = "DEEPSEEK_API_KEY",
					endpoint = "https://api.deepseek.com/v1",
					model = "deepseek-flash",
					--model = "deepseek-v4-pro",
					timeout = 30000,
					max_tokens = 4096,
					["local"] = false,
				},
				qwen = {
					__inherited_from = "openai",
					api_key_name = "QIANWEN_API_KEY",
					endpoint = "https://maas.qianwenaiapi.com/compatible-mode/v1",
					model = "qwen3.7-flash",
					timeout = 30000,
					max_tokens = 4096,
					disable_tools = true,
					["local"] = false,
				},
			},
			windows = {
				width = 35,
				input = {
					height = 12,
				},
				spinner = {
					thinking = { "🤔", "🫡", "🥱", "🫣", "🤥", "🤧", "😴" },
					generating = { "🕐", "🕒", "🕓", "🕕", "🕖", "🕘", "🕚" },
				},
				use_absolute_path = true,
			},
		},
	},
}
