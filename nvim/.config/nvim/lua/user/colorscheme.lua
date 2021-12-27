local nightfox = require('nightfox')

nightfox.setup({
    fox = "nordfox",
    transparent = false,
    alt_nc = false,
    terminal_colors = true,
    styles = {
        comments = "italic",
        functions = "italic",
        keywords = "italic",
        strings = "NONE",
        variables = "NONE",
    },
    inverse = {
        match_paren = false,
        visual = false,
        search = false,
    },
    colors = {},
    hlgroups = {
        GitSignsAdd = {fg = '${green}'},
        GitSignsChange = {fg = '${yellow}'},
        GitSignsDelete = {fg = '${red}'}
    },
})

nightfox.load()
