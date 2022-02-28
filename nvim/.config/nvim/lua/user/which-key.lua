local wk = require("which-key")
local hop = require("hop")
vim.g.mapleader = " "

hop.setup()

local setup = {
	plugins = {
		marks = true,
		registers = true,
		spelling = {
			enabled = false,
			suggestions = 10,
		},
		presets = {
			operators = true,
			motions = true,
			text_objects = true,
			windows = true,
			nav = true,
			z = true,
			g = true,
		},
	},
	operators = { gc = "Comments" },
	key_labels = {},
	icons = {
		breadcrumb = "»",
		separator = "➜",
		group = "+",
	},
	popup_mappings = {
		scroll_down = "<c-d>",
		scroll_up = "<c-u>",
	},
	window = {
		border = "double",
		position = "bottom",
		margin = { 2, 2, 2, 2 },
		padding = { 2, 2, 2, 2 },
	},
	layout = {
		height = { min = 4, max = 25 },
		width = { min = 20, max = 50 },
		spacing = 3,
		align = "left",
	},
	ignore_missing = false,
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
	show_help = true,
	triggers = "auto",
	triggers_blacklist = {
		n = {},
		i = {},
		v = {},
	},
}

wk.setup(setup)

-- NORMAL (SILENT, NOREMAP)
wk.register({
	["<leader>"] = {
		f = {
			name = "File",
			f = { '<cmd>lua require("user.telescope").find_files()<cr>', "Find Files" },
			g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
		},
		d = {
			b = { '<cmd>lua require"dap".toggle_breakpoint()<cr>', "Toggle Breakpoint" },
			r = { '<cmd>lua require"dap".repl.open()<cr>', "Open REPL" },
			t = { '<cmd>lua require"dapui".toggle()<cr>', "Dap UI Toggle" },
		},
		s = {
			name = "Search",
			b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
			c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
			h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
			M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
			r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
			R = { "<cmd>Telescope registers<cr>", "Registers" },
			k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
			C = { "<cmd>Telescope commands<cr>", "Commands" },
			t = { "<cmd>TodoTelescope", "Todo" },
		},
		h = {
			name = "Git",
			s = { '<cmd>lua require "gitsigns".stage_hunk()<cr>', "Stage Hunk" },
			u = { '<cmd>lua require "gitsigns".undo_stage_hunk()<cr>', "Undo Stage Hunk" },
			r = { '<cmd>lua require "gitsigns".reset_hunk()<cr>', "Reset Hunk" },
			R = { '<cmd>lua require "gitsigns".reset_buffer()<cr>', "Reset Buffer" },
			p = { '<cmd>lua require "gitsigns".preview_hunk()<cr>', "Preview Hunk" },
			b = { '<cmd>lua require "gitsigns".blame_line()<cr>', "Blame" },
			S = { "<cmd>Gitsigns stage_buffer<CR>", "Stage Buffer" },
			U = { "<cmd>Gitsigns reset_buffer_index<CR>", "Reset Buffer Index" },

			O = { "<cmd>Telescope git_status<cr>", "Open changed file" },
			B = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
			C = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
			a = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
		},
		x = {
			name = "Trouble",
			x = { "<cmd>TroubleToggle<cr>", "Toggle" },
			w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics" },
			d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics" },
			q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
			l = { "<cmd>TroubleToggle loclist<cr>", "Location List" },
			t = { "<cmd>TodoTrouble<cr>", "Todos" },
		},
		w = {
			name = "Focus",
			w = { "<cmd>FocusSplitCycle<cr>", "Cycle Splits" },
			T = { "<cmd>FocusToggle<cr>", "Toggle" },
			h = { "<cmd>FocusSplitLeft<cr>", "Focus Left" },
			j = { "<cmd>FocusSplitDown<cr>", "Focus Down" },
			k = { "<cmd>FocusSplitUp<cr>", "Focus Up" },
			l = { "<cmd>FocusSplitRight<cr>", "Focus Right" },
			e = { "<cmd>FocusEqualise<cr>", "Equalise" },
			m = { "<cmd>FocusMaximise<cr>", "Maximise" },
			t = { "<cmd>FocusMaxOrEqual<cr>", "Toggle Maximise or Equalise" },
		},
		t = {
			name = "Terminal",
			f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		},
		o = {
			name = "Neorg",
		},
        e = { "<cmd>NvimTreeToggle<cr>", "Toggle ChadTree" },
	},
	g = {
		c = {
			name = "Comments Linewise",
			c = { "Toggle current line using linewise comment" },
			o = { "Insert comment to the next line" },
			O = { "Insert comment to the previous line" },
			A = { "Insert comment to the end of current line" },
		},
		b = {
			name = "Comments Blockwise",
			c = { "Toggle current line using blockwise comment" },
		},
	},

	y = {
		s = { "Surround" },
	},

	f = { "<cmd>HopChar1CurrentLineAC<cr>", "Hop to Character Forward" },
	F = { "<cmd>HopChar1CurrentLineBC<cr>", "Hop to Character Back" },
	t = { "<cmd>HopChar2AC<cr>", "Hop to 2 Character Forward" },
	T = { "<cmd>HopChar2BC<cr>", "Hop to 2 Character Back" },

	["]c"] = { "<cmd>Gitsigns next_hunk<CR>", "Next Hunk" },
	["[c"] = { "<cmd>Gitsigns prev_hunk<CR>", "Prev Hunk" },
	["]b"] = { "<cmd>bnext<cr>", "Next Buffer" },
	["[b"] = { "<cmd>bprev<cr>", "Prev Buffer" },
	["]t"] = { "<cmd>tabnext<cr>", "Next Tab" },
	["[t"] = { "<cmd>tabprev<cr>", "Prev Tab" },

	["<F9>"] = { '<cmd>lua require"dap".continue()<cr>', "Continue" },
	["<F10>"] = { '<cmd>lua require"dap".step_over()<cr>', "Step Over" },
	["<F11>"] = { '<cmd>lua require"dap".step_into()<cr>', "Step Into" },
	["<F12>"] = { '<cmd>lua require"dap".step_out()<cr>', "Step Out" },

	["<left>"] = { "<nop>", "" },
	["<up>"] = { "<nop>", "" },
	["<down>"] = { "<nop>", "" },
	["<right>"] = { "<nop>", "" },
}, {
	mode = "n",
	silent = true,
	noremap = true,
})

-- INSERT (SILENT, NOREMAP)
wk.register({
	["<tab>"] = { 'pumvisible() ? "\\<C-n>" : "\\<tab>"', "", expr = true },
	["<s-tab>"] = { 'pumvisible() ? "\\<C-p>" : "\\<bs>"', "", expr = true },
	["<cr>"] = { "v:lua.MPairsUtils.CR()", "", expr = true },
	["<bs>"] = { "v:lua.MPairsUtils.BS()", "", expr = true },

	["<left>"] = { "<nop>", "" },
	["<up>"] = { "<nop>", "" },
	["<down>"] = { "<nop>", "" },
	["<right>"] = { "<nop>", "" },
}, {
	mode = "i",
	silent = true,
	noremap = true,
})

-- VISUAL (SILENT, NOREMAP)
wk.register({
	g = {
		name = "Comments",
		c = { "Toggle region using linewise comment" },
		b = { "Toggle region using blockwise comment" },
	},

	f = { "<cmd>HopChar1CurrentLineAC<cr>", "Hop to Character Forward" },
	F = { "<cmd>HopChar1CurrentLineBC<cr>", "Hop to Character Back" },
	t = { "<cmd>HopChar2AC<cr>", "Hop to 2 Character Forward" },
	T = { "<cmd>HopChar2BC<cr>", "Hop to 2 Character Back" },

	["<left>"] = { "<nop>", "" },
	["<up>"] = { "<nop>", "" },
	["<down>"] = { "<nop>", "" },
	["<right>"] = { "<nop>", "" },
}, {
	mode = "x",
	silent = true,
	noremap = true,
})

-- OPERATOR PENDING (SILENT, NOREMAP)
wk.register({

	f = { "<cmd>HopChar1AC<cr>", "Hop to Character Forward" },
	F = { "<cmd>HopChar1BC<cr>", "Hop to Character Back" },
	t = { "<cmd>HopChar2AC<cr>", "Hop to 2 Character Forward" },
	T = { "<cmd>HopChar2BC<cr>", "Hop to 2 Character Back" },
}, {
	mode = "o",
	silent = true,
	noremap = true,
})
