local nightfox = require('nightfox')

nightfox.setup({
  fox = "nordfox",
  transparent = false,
  alt_nc = false,
  terminal_colors = true,
  styles = {
    comments = "NONE",
    functions = "NONE",
    keywords = "NONE",
    strings = "NONE",
    variables = "NONE",
  },
  inverse = {
    match_paren = false,
    visual = false,
    search = false,
  },
  colors = {},
  hlgroups = {},
})

nightfox.load()
