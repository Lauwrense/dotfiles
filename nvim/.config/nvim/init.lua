local user_modules = {
	"user.plugins",
	"user.options",

	"user.colorscheme",
	"user.lsp",
	"user.coq",
	"user.treesitter",
	"user.telescope",
	"user.gitsigns",
	"user.neorg",
	"user.dap",

	"user.autopairs",
	"user.toggleterm",
	"user.lspsaga",
	"user.trouble",
	"user.todo-comments",
	"user.comment",
	"user.colorizer",
	"user.surround",
	"user.hop",

	"user.which-key",
	"user.statusline",
	"user.tabline",
    "user.tree",
	"user.impatient",
	"user.indent-blankline",
	"user.focus",
	"user.better-escape",
    "user.vim",
}



-- print("Some placeholder")

for _, module in pairs(user_modules) do
	local status_ok = pcall(require, module)
	if not status_ok then
		print("[M!] " .. module)
	end
end

