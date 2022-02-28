local surround = require("surround")

surround.setup({
	context_offset = 100,
	load_autogroups = false,
	mappings_style = "surround",
	map_insert_mode = true,
	quotes = { "'", '"' },
	brackets = { "(", "{", "[" },
	space_on_closing_char = false,
	pairs = {
		nestable = { { "(", ")" }, { "[", "]" }, { "{", "}" } },
		linear = { { "'", "'" }, { "`", "`" }, { '"', '"' } },
	},
	prefix = "s",
})
