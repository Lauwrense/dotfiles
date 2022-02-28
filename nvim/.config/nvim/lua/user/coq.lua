vim.g.coq_settings = {
	auto_start = "shut-up",
	keymap = {
		recommended = false,
	},
}

local coq = require("coq")

-- Third party modules for COQ
require("coq_3p")({
	{ src = "dap" },
	{ src = "orgmode", short_name = "ORG" },
    { src = "vimtex", short_name = "vTEX" },
})
