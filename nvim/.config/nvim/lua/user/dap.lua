local dap_install = require("dap-install")
local dap_ui = require("dapui")
dap_install.config("codelldb", {})

dap_ui.setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
	},
	sidebar = {
		elements = {
			{
				id = "scopes",
				size = 0.25,
			},
			{ id = "breakpoints", size = 0.25 },
			{ id = "stacks", size = 0.25 },
			{ id = "watches", size = 00.25 },
		},
		size = 40,
		position = "left",
	},
	tray = {
		elements = { "repl" },
		size = 10,
		position = "bottom",
	},
	floating = {
		max_height = 0.6,
		max_width = 0.6,
		border = "rounded",
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
})
