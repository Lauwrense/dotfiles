local tabby = require("tabby")
local tabby_presets = require("tabby.presets")
local filename = require("tabby.filename")
local util = require("tabby.util")

local colors = {
	cyan = "#88c0d0",
	blue = "#81a1c1",
	dark1 = "#2e3440",
	dark4 = "#4c566a",
	fg = "#e5e9f0",
	fg_sec = "#d8dee9",
}

local cwd = function()
	return " " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " "
end


local tabname = function(tabid)
	return vim.api.nvim_tabpage_get_number(tabid)
end

-- TODO: Make Customization
local components = {
	hl = { fg = colors.fg, dark1 = colors.dark1 },
	layout = "active_wins_at_tail",
	head = {
		{ cwd, hl = { fg = colors.dark1, bg = colors.cyan } },
		{ "", hl = { fg = colors.cyan, bg = colors.dark1 } },
	},
	active_tab = {
		label = function(tabid)
			return {
				"  " .. tabname(tabid) .. " ",
				hl = { fg = colors.dark1, bg = colors.blue, style = "bold" },
			}
		end,
		left_sep = { "", hl = { fg = colors.blue, bg = colors.dark1 } },
		right_sep = { "", hl = { fg = colors.blue, bg = colors.dark1 } },
	},
	inactive_tab = {
		label = function(tabid)
			return {
				"  " .. tabname(tabid) .. " ",
				hl = { fg = colors.fg, bg = colors.dark4, style = "bold" },
			}
		end,
		left_sep = { "", hl = { fg = colors.dark4, bg = colors.dark1 } },
		right_sep = { "", hl = { fg = colors.dark4, bg = colors.dark1 } },
	},
	top_win = {
		label = function(winid)
			return {
				"  " .. filename.unique(winid) .. " ",
				hl = { fg = colors.fg, bg = colors.dark4 },
			}
		end,
		left_sep = { "", hl = { fg = colors.dark4, bg = colors.dark1 } },
		right_sep = { "", hl = { fg = colors.dark4, bg = colors.dark1 } },
	},
	win = {
		label = function(winid)
			return {
				"  " .. filename.unique(winid) .. " ",
				hl = { fg = colors.fg, bg = colors.dark4 },
			}
		end,
		left_sep = { "", hl = { fg = colors.dark4, bg = colors.dark1 } },
		right_sep = { "", hl = { fg = colors.dark4, bg = colors.dark1 } },
	},
	tail = {
		{ "", hl = { fg = colors.blue, bg = colors.dark1 } },
		{ "  ", hl = { fg = colors.dark1, bg = colors.blue } },
	},
}

tabby.setup({
	tabline = components,
})
