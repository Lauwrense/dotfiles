local feline = require("feline")

-- Based on nightfox (nord variation) and nord
local colors = {
	dark0 = "#232831",
	dark1 = "#2e3440",
	dark2 = "#3b4252",
	dark3 = "#434c5e",
	dark4 = "#4c566a",

	light0 = "#b9bfca",
	light1 = "#d8dee9",
	light2 = "#e5e9f0",
	light3 = "#eceff4",

	bg = "#2e3440",
	bg_statusline = "#3b4252",

	black = "#3b4252",
	red = "#bf616a",
	green = "#a3be8c",
	yellow = "#ebcb8b",
	dark_blue = "#5e81ac",
	blue = "#81a1c1",
	magenta = "#b48ead",
	cyan_green = "#8FBCBB",
	cyan = "#88c0d0",
	white = "#e5e9f0",
	orange = "#d08770",

	comment = "#60728a",

	git = {
		add = "#70a288",
		change = "#a58155",
		delete = "#904a6a",
		conflict = "#c07a6d",
	},

	gitSigns = {
		add = "#164846",
		change = "#394b70",
		delete = "#823c41",
	},
}

feline.add_theme("nord", colors)

local icons = {}

-- Vi Mode Components
local vi_mode_utils = require("feline.providers.vi_mode")
local vi_mode_component_bar = {
	provider = "█",
	hl = function()
		return {
			fg = vi_mode_utils.get_mode_color(),
			bg = colors.dark0,
		}
	end,
	right_sep = {
		str = " ",
		hl = {
			bg = colors.dark0,
		},
	},
}

local vi_mode_component = {
	provider = "vi_mode",
	hl = function()
		return {
			name = vi_mode_utils.get_mode_highlight_name(),
			fg = vi_mode_utils.get_mode_color(),
			bg = colors.dark0,
			style = "bold",
		}
	end,
	right_sep = {
		str = " ",
		hl = {
			bg = colors.dark0,
		},
	},
}

local vi_mode_colors = {
	NORMAL = colors.green,
	INSERT = colors.red,
	VISUAL = colors.magenta,
	OP = colors.green,
	BLOCK = colors.blue,
	REPLACE = colors.magenta,
	["V-REPLACE"] = colors.magenta,
	ENTER = colors.cyan,
	MORE = colors.cyan,
	SELECT = colors.orange,
	COMMAND = colors.green,
	SHELL = colors.green,
	TERM = colors.green,
	NONE = colors.yellow,
}

-- File Info Component
local file_info_component = {
	provider = "file_info",
	hl = {
		fg = colors.cyan_green,
		bg = colors.dark3,
		style = "bold",
	},
	left_sep = {
		{ str = "", hl = { bg = colors.dark0, fg = colors.dark3 } },
		{ str = " ", hl = { bg = colors.dark3, fg = "NONE" } },
	},
	right_sep = {
		{ str = " ", hl = { bg = colors.dark3, fg = "NONE" } },
		{ str = "", hl = { bg = colors.dark0, fg = colors.dark3 } },
	},
}

-- Git
local git_component = {
	branch = {
		provider = "git_branch",
		hl = {
			fg = colors.light0,
			bg = colors.dark2,
		},
		right_sep = {
			{ str = " ", hl = { bg = colors.dark2 } },
			{ str = "", hl = { bg = colors.dark0, fg = colors.dark2 } },
		},
		left_sep = {
			{ str = "", hl = { bg = colors.dark0, fg = colors.dark2 } },
			{ str = " ", hl = { bg = colors.dark2 } },
		},
	},

	add = {
		provider = "git_diff_added",
		hl = {
			fg = colors.green,
			bg = colors.dark0,
		},
		icon = "+",
		right_sep = { str = " ", hl = { bg = colors.dark0 } },
		left_sep = { str = " ", hl = { bg = colors.dark0 } },
	},

	change = {
		provider = "git_diff_changed",
		hl = {
			fg = colors.yellow,
			bg = colors.dark0,
		},
		icon = "~",
		right_sep = { str = " ", hl = { bg = colors.dark0 } },
		left_sep = { str = " ", hl = { bg = colors.dark0 } },
	},

	remove = {
		provider = "git_diff_removed",
		hl = {
			fg = colors.red,
			bg = colors.dark0,
		},
		icon = "-",
		right_sep = { str = " ", hl = { bg = colors.dark0 } },
		left_sep = { str = " ", hl = { bg = colors.dark0 } },
	},
}

-- Diagnostic
local lsp = require("feline.providers.lsp")
local lsp_severity = vim.diagnostic.severity
local diagnostics_component = {
	err = {
		provider = "diagnostic_errors",
		enabled = function()
			return lsp.diagnostics_exist(lsp_severity.ERROR)
		end,
		hl = {
			fg = colors.red,
			bg = colors.dark0,
		},
		icon = "  ",
	},

	warn = {
		provider = "diagnostic_warnings",
		enabled = function()
			return lsp.diagnostics_exist(lsp_severity.WARN)
		end,
		hl = {
			fg = colors.yellow,
			bg = colors.dark0,
		},
		icon = "  ",
	},

	hint = {
		provider = "diagnostic_hints",
		enabled = function()
			return lsp.diagnostics_exist(lsp_severity.HINT)
		end,
		hl = {
			fg = colors.blue,
			bg = colors.dark0,
		},
		icon = "  ",
	},

	info = {
		provider = "diagnostic_info",
		enabled = function()
			return lsp.diagnostics_exist(lsp_severity.INFO)
		end,
		hl = {
			fg = colors.green,
			bg = colors.dark0,
		},
		icon = "  ",
	},
}

-- File Type Component
local file_encoding_component = {
	provider = "file_encoding",
	hl = {
		fg = colors.magenta,
		bg = colors.dark2,
	},
	right_sep = {
		{ str = " ", hl = { bg = colors.dark2 } },
	},
	left_sep = {
		{ str = " ", hl = { bg = colors.dark0 } },
		{ str = "", hl = { bg = colors.dark0, fg = colors.magenta } },
		{ str = " ", hl = { bg = colors.magenta, fg = colors.dark0 } },
		{ str = " ", hl = { bg = colors.dark2 } },
	},
}
local file_type_component = {
	provider = "file_type",
	hl = {
		fg = colors.magenta,
		bg = colors.dark2,
	},
	right_sep = {
		{ str = " ", hl = { bg = colors.dark2 } },
	},
	left_sep = {
		{ str = " ", hl = { bg = colors.dark2 } },
	},
}

-- Position
local position_component = {
	provider = "position",
	hl = {
		fg = colors.cyan,
		bg = colors.dark3,
	},
	right_sep = {
		{ str = " ", hl = { bg = colors.dark3, fg = colors.cyan } },
	},
	left_sep = {
		{ str = "", hl = { bg = colors.dark3, fg = colors.cyan } },
		{ str = " ", hl = { bg = colors.cyan, fg = colors.dark0 } },
		{ str = " ", hl = { bg = colors.dark3 } },
	},
}
local line_percentage_component = {
	provider = "line_percentage",
	hl = {
		fg = colors.cyan,
		bg = colors.dark3,
	},
	right_sep = {
		{ str = " ", hl = { bg = colors.dark3 } },
	},
}

-- Statusline Separators
local separator_component = {
	bar_inactive = {
		provider = "█",
		hl = {
			fg = colors.green,
			bg = colors.dark0,
		},
	},
	space_inactive = {
		provider = " ",
		hl = {
			fg = colors.dark0,
			bg = colors.dark0,
		},
    },
}

local components = {
	active = {},
	inactive = {},
}

components.active[1] = {
	vi_mode_component_bar,
	vi_mode_component,
	file_info_component,
	git_component.branch,
	git_component.add,
	git_component.change,
	git_component.remove,
}

components.active[2] = {
	diagnostics_component.err,
	diagnostics_component.warn,
	diagnostics_component.hint,
	diagnostics_component.info,
	file_encoding_component,
	file_type_component,
	position_component,
	line_percentage_component,
}

-- File Info Component
local file_info_component_inactive = {
	provider = "file_info",
	hl = {
		fg = colors.cyan_green,
		bg = colors.dark3,
		style = "bold",
	},
	left_sep = {
		{ str = " ", hl = { bg = colors.dark3, fg = "NONE" } },
	},
	right_sep = {
		{ str = " ", hl = { bg = colors.dark3, fg = "NONE" } },
		{ str = "", hl = { bg = colors.dark0, fg = colors.dark3 } },
	},
}

local file_type_component_inactive = {
	provider = "file_type",
	hl = {
		fg = colors.magenta,
		bg = colors.dark2,
	},
	right_sep = {
		{ str = " ", hl = { bg = colors.dark2, fg = colors.magenta } },
	},
	left_sep = {
		{ str = "", hl = { bg = colors.dark0, fg = colors.magenta } },
		{ str = " ", hl = { bg = colors.magenta, fg = colors.dark0 } },
		{ str = " ", hl = { bg = colors.dark2 } },
	},
}



components.inactive[1] = {
	separator_component.bar_inactive,
	file_info_component_inactive,
	git_component.branch,
    separator_component.space_inactive
}

components.inactive[2] = {
	file_type_component_inactive,
}

feline.setup({
	theme = "nord",
	components = components,
	vi_mode_colors = vi_mode_colors,
})
