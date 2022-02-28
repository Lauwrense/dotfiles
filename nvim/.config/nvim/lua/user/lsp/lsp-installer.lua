local lsp_installer = require("nvim-lsp-installer")

local servers = {
	"sumneko_lua",
	"bashls",
	"vimls",
	"rust_analyzer",
	"toml",
	"zls",
	"ccls",
	"svelte",
	"tsserver",
	"tailwindcss",
	"cssls",
	"eslint",
	"texlab",
	"pyright",
}

for _, name in pairs(servers) do
	local server_is_found, server = lsp_installer.get_server(name)

	if server_is_found then
		if not server:is_installed() then
			server:install()
		end
	end
end

local on_attach = function(client, bufnr)
	vim.diagnostic.config({
		virtual_text = true,
		signs = true,
		underline = true,
		update_in_insert = true,
		severity_sort = false,
	})

	local wk = require("which-key")

	wk.register({
		["<leader>"] = {
			c = {
				name = "Diagnostics",
				a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
				d = { '<cmd>lua require("lspsaga.diagnostic").show_line_diagnostics()<cr>', "Show Line Diagnostics" },
				c = {
					'<cmd>lua require("lspsaga.diagnostic").show_cursor_diagnostics()<cr>',
					"Show Cursor Diagnostics",
				},
				l = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
			},
		},
		g = {
			h = { '<cmd>lua require("lspsaga.provider").lsp_finder()<cr>', "Definition and Reference" },
			s = { '<cmd>lua require("lspsaga.signaturehelp").signature_help()', "Signature Help" },
			r = { '<cmd>lua require("lspsaga.rename").rename()<cr>', "Rename" },
			d = { '<cmd>lua require("lspsaga.provider").preview_definition()<cr>', "Preview Definition" },
		},
		K = { "<cmd>Lspsaga hover_doc<cr>", "Hover Docs" },
		["<C-b>"] = { '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<cr>', "", noremap = false },
		["<C-f>"] = { '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<cr>', "", noremap = false },
		["]e"] = { '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()', "LSP Diagnostics Next" },
		["[e"] = { '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()', "LSP Diagnostics Prev" },
	}, {
		buffer = bufnr,
		mode = "n",
		silent = true,
		noremap = true,
	})

	wk.register({
		["<leader>"] = {
			c = {
				a = { ":<c-u>Lspsaga range_code_action<cr>", "Code Action" },
			},
		},
	}, {
		mode = "x",
		buffer = bufnr,
		silent = true,
		noremap = true,
	})
end

-- External Tools
local set_rust_analyzer = function(server, opts)
	local extension_path = vim.fn.stdpath("data")
	local codelldb_path = extension_path .. "/dapinstall/codelldb/extension/adapter/codelldb"
	local liblldb_path = extension_path .. "/dapinstall/codelldb/extension/lldb/lib/liblldb.so"

	local rust_analyzer_settings = require("user.lsp.settings.rust_analyzer")

	opts = vim.tbl_deep_extend("force", rust_analyzer_settings, opts)

	local rust_opts = {
		tools = {
			autoSetHints = true,
			hover_with_actions = true,
			executor = require("rust-tools/executors").termopen,
			runnables = {
				use_telescope = true,
			},
			debuggables = {
				use_telescope = true,
			},
			inlay_hints = {
				only_current_line = false,
				only_current_line_autocmd = "CursorHold",
				show_parameter_hints = true,
				parameter_hints_prefix = "<- ",
				other_hints_prefix = "=> ",
				max_len_align = false,
				max_len_align_padding = 1,
				right_align = false,
				right_align_padding = 7,
				highlight = "Comment",
			},
			hover_actions = {
				border = {
					{ "╭", "FloatBorder" },
					{ "─", "FloatBorder" },
					{ "╮", "FloatBorder" },
					{ "│", "FloatBorder" },
					{ "╯", "FloatBorder" },
					{ "─", "FloatBorder" },
					{ "╰", "FloatBorder" },
					{ "│", "FloatBorder" },
				},
				auto_focus = true,
			},
			crate_graph = {
				backend = "x11",
				output = nil,
				full = true,
			},
		},
		server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
		dap = {
			adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
		},
	}
	require("rust-tools").setup(rust_opts)
	server:attach_buffers()
end

require("lspconfig").gdscript.setup({
	on_attach = on_attach,
	capabilities = coq.lsp_ensure_capabilities(vim.lsp.protocol.make_client_capabilities()),
})

-- LSP Instalelr
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = on_attach,
		capabilities = vim.lsp.protocol.make_client_capabilities(),
	}

	if server.name == "sumneko_lua" then
		local sumneko_lua = require("user.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_lua, opts)
		server:setup(coq.lsp_ensure_capabilities(opts))
	elseif server.name == "rust_analyzer" then
		set_rust_analyzer(server, coq.lsp_ensure_capabilities(opts))
	else
		server:setup(coq.lsp_ensure_capabilities(opts))
	end
end)

lsp_installer.settings({
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
		keymaps = {
			toggle_server_expand = "<CR>",
			install_server = "i",
			update_server = "u",
			uninstall_server = "X",
		},
		log_level = vim.log.levels.INFO,
		max_concurrent_installers = 4,
	},
})
