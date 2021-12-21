require("presence"):setup({
    auto_update = true,
    neovim_image_text = "The One True Text Editor",
    main_image = "neovim",
    log_level = nil,
    debounce_timeout = 10,
    enable_line_number  = false,
    blacklist = {},
    buttons = true,

    editing_text = "Editing %s",
    file_explorer_text = "Browsing %s",
    git_commit_text = "Committing changes",
    plugin_manager_text = "Managing plugins",
    reading_text = "Reading %s",
    workspace_text = "Working on %s",
    line_number_text = "Line %s out of %s",
})


require('colorizer').setup({
    ['*'] = {
        RGB = true,
        RRGGBB = true,
        names = true,
        RRGGBBAA = true,
        rgb_rn = true,
        hsl_fn = true,
        css = false,
        css_fn = false,
        mode = 'background'
    }
})