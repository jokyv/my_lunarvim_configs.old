-- NOTE: general settings here!
lvim.format_on_save = true
lvim.lint_on_save = false
lvim.colorscheme = "tokyonight"
-- vim.g.tokyonight_style = "night"
-- lvim.colorscheme = "spacegray"
lvim.leader = "space"
-- have spell check on all the time
-- lvim.default_settings.spell = true

-- NOTE: settings for core plugins here!
-- git signs settings
-- lvim.builtin.gitsigns.active = false
-- dashboard settings
lvim.builtin.dashboard.active = true
lvim.builtin.dashboard.footer = { "" }
lvim.builtin.dashboard.custom_header = { "" }
-- terminal settings
lvim.builtin.terminal.active = true
-- nvimtree settings
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.hide_dotfiles = false
lvim.builtin.nvimtree.show_icons.git = false
lvim.builtin.nvimtree.ignore = { ".git", ".idea", ".vscode" }
-- barbar settings
lvim.builtin.bufferline.active = true
-- auto-pairs
-- lvim.builtin.auto-pairs.add_rules = ("<", ">", "lua")
-- treesitter settings
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.autotag.enable = true
-- LSP settings
lvim.lsp.diagnostics.virtual_text = false
-- compe settings
lvim.builtin.compe.autocomplete = true
-- lua line settings
lvim.builtin.lualine.options.component_separators = { "||" }

-- NOTE: Additional Plugins here!
lvim.plugins = {
	{ "folke/tokyonight.nvim" },
	{
		"simrat39/rust-tools.nvim",
		config = function()
			require("user.rust_tools").config()
		end,
		ft = { "rust", "rs" },
	},
	{
		"folke/todo-comments.nvim",
		config = function()
			require("user.todo-comments").config()
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
}

-- PYTHON: settings
-- lvim.lang.python.lsp = {
-- 	{
-- 		exe = "jedi",
-- 		args = {},
-- 	},
-- }

lvim.lang.python.linters = {
	{
		exe = "flake8",
		-- args = {},
	},
}

lvim.lang.python.formatters = {
	{
		exe = "black",
		-- args = {},
	},
}

-- LUA: settings
lvim.lang.lua.formatters = {
	{
		exe = "stylua",
		-- args = {},
	},
}

-- RUST: settings
lvim.lsp.override = { "rust" }
lvim.lang.rust.formatting = { { exe = "rustfmt" } }
lvim.autocommands.custom_groups = {
	-- rust
	{ "Filetype", "rust", "nnoremap <leader>m <cmd>lua require('core.terminal')._exec_toggle('cargo build;read')<CR>" },
	{ "Filetype", "rust", "nnoremap <leader>r <cmd>lua require('core.terminal')._exec_toggle('cargo run;read')<CR>" },
	{
		"Filetype",
		"rust",
		"nnoremap <leader>t <cmd>lua require('toggleterm.terminal').Terminal:new {cmd='cargo test -- --ignored;read', hidden =false}:toggle()<CR>",
	},
	{ "Filetype", "rust", "nnoremap <leader>H <cmd>lua require('core.terminal')._exec_toggle('cargo clippy;read')<CR>" },
	{ "Filetype", "rust", "nnoremap <leader>lm <Cmd>RustExpandMacro<CR>" },
	{ "Filetype", "rust", "nnoremap <leader>lH <Cmd>RustToggleInlayHints<CR>" },
	{ "Filetype", "rust", "nnoremap <leader>le <Cmd>RustRunnables<CR>" },
	{ "Filetype", "rust", "nnoremap <leader>lh <Cmd>RustHoverActions<CR>" },
}
