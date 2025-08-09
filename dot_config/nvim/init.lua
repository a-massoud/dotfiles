vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"tpope/vim-surround",
	"echasnovski/mini.pairs",
	"tpope/vim-commentary",
	"tpope/vim-repeat",
	"tpope/vim-speeddating",
	"tpope/vim-unimpaired",
	"tpope/vim-fugitive",
	"farmergreg/vim-lastplace",
	"nvim-lualine/lualine.nvim",
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons",
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x" },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"nvim-telescope/telescope-file-browser.nvim",
	{ "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000 },
	"dhruvasagar/vim-table-mode",
	"junegunn/vim-easy-align",
	"vim-scripts/utl.vim",
	"SirVer/ultisnips",
	"mason-org/mason.nvim",
	"neovim/nvim-lspconfig",
	"stevearc/conform.nvim",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"quangnguyen30192/cmp-nvim-ultisnips",
	"mfussenegger/nvim-dap",
	"nvim-neotest/nvim-nio",
	"rcarriga/nvim-dap-ui",
	"theHamsta/nvim-dap-virtual-text",
	{ "mfussenegger/nvim-jdtls", dependencies = "mfussenegger/nvim-dap" },
	{ "lervag/vimtex", lazy = false },
	"mattn/emmet-vim",
	"tikhomirov/vim-glsl",
	"norcalli/nvim-colorizer.lua",
	-- "barreiroleo/ltex_extra.nvim",
	{ "R-nvim/R.nvim", lazy = false },
	"R-nvim/cmp-r",
	"stevearc/dressing.nvim",
	{ "rcarriga/nvim-notify", lazy = false, dependencies = { "MunifTanjim/nui.nvim", "folke/noice.nvim" } },
	{ "folke/noice.nvim", lazy = false },
	"stevearc/overseer.nvim",
	{ "mrcjkb/rustaceanvim", lazy = false },
	"leoluz/nvim-dap-go",
	"akinsho/toggleterm.nvim",
	"mfussenegger/nvim-dap-python",
	"Civitasv/cmake-tools.nvim",
})

-- comentary: use single-line comments for c/c++
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "c", "cpp" },
	callback = function(ev)
		vim.opt.commentstring = "//%s"
	end,
})

-- pairs
require("mini.pairs").setup()

-- basic editing options
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.formatoptions = "croqnj"
vim.opt.joinspaces = false
vim.opt.textwidth = 80
vim.opt.scrolloff = 5
vim.opt.title = true
vim.opt.titlelen = 0
vim.opt.fixeol = false
vim.opt.delcombine = true
vim.opt.spell = false
vim.opt.spelllang = "en_us,es_mx,fr,cjk"

-- search options
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- swap files
vim.opt.swapfile = true

-- display
vim.opt.encoding = "utf-8"
vim.opt.ruler = true
vim.opt.laststatus = 2
vim.opt.showmatch = true
vim.opt.matchtime = 0
vim.opt.showmode = true
vim.opt.wildmenu = true
vim.opt.number = true
vim.opt.relativenumber = false

-- syntax
vim.opt.cursorline = true
-- vim.opt.bg = "dark"
vim.env["NVIM_TUI_ENABLE_TRUE_COLOR"] = "1"
if vim.fn.has("termguicolors") then
	vim.opt.termguicolors = true
end
require("catppuccin").setup({
	flavour = "auto",
	background = {
		light = "latte",
		dark = "mocha",
	},
	integrations = {
		notify = true,
		cmp = true,
		dap = true,
		dap_ui = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
				ok = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
				ok = { "underline" },
			},
			inlay_hints = {
				background = true,
			},
		},
		nvimtree = true,
		treesitter = true,
		telescope = { enabled = true },
		noice = true,
		overseer = true,
	},
})
vim.cmd("colorscheme catppuccin")

-- lualine
vim.g.bufferline_echo = 0
vim.opt.showmode = false
local lualine = require("lualine")
lualine.setup({
	options = { theme = "catppuccin" },
	extensions = { "quickfix", "fugitive", "lazy", "man", "nvim-dap-ui" },
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "overseer", "encoding", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
-- vim.g.airline_theme = 'onedark'
-- vim.g.airline_powerline_fonts = 1
-- vim.g['airline#extensions#tabline#enabled'] = 1
-- vim.g['airline#extensions#tabline#show_close_button'] = 0
-- vim.g['airline#extensions#tabline#tabs_label'] = ''
-- vim.g['airline#extensions#tabline#buffers_label'] = ''
-- vim.g['airline#extensions#tabline#fnamemod'] = ':t'
-- vim.g['airline#extensions#tabline#show_tab_count'] = 0
-- vim.g['airline#extensions#tabline#show_buffers'] = 0
-- vim.g['airline#extensions#tabline#show_splits'] = 0
-- vim.g['airline#extensions#tabline#show_tab_nr'] = 0
-- vim.g['airline#extensions#tabline#show_tab_type'] = 0
-- vim.g['airline#extensions#tabline#tab_min_count'] = 2

-- colorizer
require("colorizer").setup()

-- treesitter
require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
	sync_install = false,
	auto_install = true,
	ignore_install = {},
	highlight = {
		enable = true,
		disable = { "tex", "latex" },
	},
	indent = {
		enable = true,
	},
})

-- telescope
local fb_actions = require("telescope").extensions.file_browser.actions
require("telescope").setup({
	extensions = {
		file_browser = {
			respect_gitignore = false,
			hijack_netrw = true,
			mappings = {
				["i"] = {
					["<A-CR>"] = fb_actions.create_from_prompt,
				},
			},
		},
	},
})
require("telescope").load_extension("file_browser")

vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep hidden=true<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fn", "<cmd>Telescope file_browser<cr>", { noremap = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>fc",
	"<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>",
	{ noremap = true }
)

-- F2 to toggle search highlighting
vim.api.nvim_set_keymap("", "<F2>", "<cmd>nohl<CR>", { noremap = true })
vim.api.nvim_set_keymap("i", "<F2>", "<Esc><cmd>nohl<CR>a", { noremap = true })

-- F5 to switch rl
vim.api.nvim_set_keymap("", "<F5>", "<cmd>set rl!<CR>", { noremap = true })
vim.api.nvim_set_keymap("i", "<F5>", "<Esc><cmd>set rl!<CR>a", { noremap = true })

-- F5 to switch arab
vim.api.nvim_set_keymap("", "<F6>", "<cmd>set arab!<CR>", { noremap = true })
vim.api.nvim_set_keymap("i", "<F6>", "<Esc><cmd>set arab!<CR>a", { noremap = true })

-- vim-easy-align
vim.api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)", { noremap = true })
vim.api.nvim_set_keymap("n", "ga", "<Plug>(EasyAlign)", { noremap = true })

-- ultisnips
vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-w>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-q>"

-- nvim-cmp.
local cmp = require("cmp")

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "ultisnips" }, -- For ultisnips users.
		{ name = "cmp_r" },
	}, {
		{ name = "buffer" },
	}),
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

-- lsp
vim.opt.signcolumn = "yes"
-- Install language servers
require("mason").setup()
-- Setup language servers.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
vim.lsp.config("pyright", { capabilities = capabilities })
vim.lsp.enable("pyright")
vim.lsp.config("ts_ls", { capabilities = capabilities })
vim.lsp.enable("ts_ls")
vim.lsp.config("jsonls", { capabilities = capabilities })
vim.lsp.enable("jsonls")
vim.lsp.config("gopls", { capabilities = capabilities })
vim.lsp.enable("gopls")
vim.lsp.config("clangd", {
	cmd = { "clangd", "--background-index", "--header-insertion=never" },
	capabilities = capabilities,
})
vim.lsp.enable("clangd")
vim.api.nvim_set_keymap("n", "gh", "<cmd>LspClangdSwitchSourceHeader<CR>", { noremap = true })
vim.lsp.config("cmake", { capabilities = capabilities })
vim.lsp.enable("cmake")
vim.lsp.config("lua_ls", {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if
				path ~= vim.fn.stdpath("config")
				and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
			then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				version = "LuaJIT",
				path = {
					"lua/?.lua",
					"lua/?/init.lua",
				},
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
				},
				-- Or pull in all of 'runtimepath'.
				-- library = {
				--   vim.api.nvim_get_runtime_file('', true),
				-- }
			},
		})
	end,
	settings = {
		Lua = {},
	},
	capabilities = capabilities,
})
vim.lsp.enable("lua_ls")
vim.lsp.config("texlab", { capabilities = capabilities })
vim.lsp.enable("texlab")
vim.lsp.config("html", { capabilities = capabilities })
vim.lsp.enable("html")
vim.lsp.config("cssls", { capabilities = capabilities })
vim.lsp.enable("cssls")
vim.lsp.config("svelte", { capabilities = capabilities })
vim.lsp.enable("svelte")
vim.lsp.config("kotlin_lsp", { capabilities = capabilities })
vim.lsp.enable("kotlin_lsp")
vim.lsp.config("gradle_ls", { capabilities = capabilities })
vim.lsp.enable("gradle_ls")
vim.lsp.config(
	"groovyls",
	{ cmd = { vim.fn.stdpath("data") .. "/mason/bin/groovy-language-server" }, capabilities = capabilities }
)
vim.lsp.enable("groovyls")
vim.lsp.config("lemminx", { capabilities = capabilities })
vim.lsp.enable("lemminx")
vim.lsp.config("splint_lsp", { capabilities = capabilities })
vim.lsp.enable("slint_lsp")
vim.cmd([[ autocmd BufRead,BufNewFile *.slint set filetype=slint ]]) -- add slint filetype
vim.lsp.config("hls", { filetypes = { "haskell", "lhaskell", "cabal" }, capabilities = capabilities })
vim.lsp.enable("hls")
vim.lsp.config("sourcekit", { filetypes = { "swift" }, capabilities = capabilities })
vim.lsp.enable("sourcekit")
vim.lsp.config("omnisharp", { capabilities = capabilities })
vim.lsp.enable("omnisharp")

-- Update command
vim.api.nvim_create_user_command("Update", function()
	vim.cmd("Lazy update")
	vim.cmd("MasonUpdate")
end, {})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, on_jump = vim.diagnostic.open_float })
end)
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, on_jump = vim.diagnostic.open_float })
end)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		-- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		-- vim.keymap.set('n', '<space>fmt', function()
		--     vim.lsp.buf.format { async = true }
		-- end, opts)
	end,
})

vim.api.nvim_set_keymap("n", "gr", "<cmd>Telescope lsp_references<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "gi", "<cmd>Telescope lsp_implementations<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>fs", "<cmd>Telescope lsp_workspace_symbols<cr>", { noremap = true })

-- conform (formatters)
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		rust = { "rustfmt", lsp_format = "fallback" },
		javascript = { "prettierd", "prettier", stop_after_first = true, lsp_format = "fallback" },
		javascriptreact = { "prettierd", "prettier", stop_after_first = true, lsp_format = "fallback" },
		typescript = { "prettierd", "prettier", stop_after_first = true, lsp_format = "fallback" },
		typescriptreact = { "prettierd", "prettier", stop_after_first = true, lsp_format = "fallback" },
		json = { "prettierd", "prettier", stop_after_first = true, lsp_format = "fallback" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		java = { lsp_format = "prefer" },
		cmake = { "cmake_format" },
		html = { "djlint" },
		toml = { "taplo" },
		go = { "gofmt", lsp_format = "fallback" },
		kotlin = { "ktfmt", lsp_format = "fallback" },
		xml = { "xmlformatter", lsp_format = "fallback" },
		groovy = { lsp_format = "prefer" },
		latex = { "latexindent", lsp_format = "fallback" },
		tex = { "latexindent", lsp_format = "fallback" },
		slint = { lsp_format = "prefer" },
	},
})
require("conform").formatters.latexindent = {
	prepend_args = { "-y=\"defaultIndent:'  '\"" },
}

vim.keymap.set("n", "<space>fmt", function()
	require("conform").format({ bufnr = 0 })
end)

-- python venvs
if vim.fn.exists("$VIRTUAL_ENV") == 1 then
	vim.g.python3_host_prog = vim.fn.substitute(vim.fn.system("which -a python3 | head -n2 | tail -n1"), "\n", "", "g")
else
	vim.g.python3_host_prog = vim.fn.substitute(vim.fn.system("which python3"), "\n", "", "g")
end

-- nvim-dap
local dap, dapui = require("dap"), require("dapui")
dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
		args = { "--port", "${port}" },
	},
	name = "codelldb",
}
dap.adapters.cpp = dap.adapters.codelldb
dap.adapters.c = dap.adapters.codelldb
dap.adapters.rust = dap.adapters.codelldb
dap.adapters.kotlin = {
	type = "executable",
	command = "kotlin-debug-adapter",
}
require("dap-go").setup()
require("dap-python").setup("python3")
dap.configurations.cpp = {
	{
		name = "Launch Codelldb",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
		runInTerminal = false,
	},
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
dap.configurations.kotlin = {
	{
		name = "Launch Kotlin Debug Adapter",
		type = "kotlin",
		request = "launch",
		mainClass = function()
			return vim.fn.input("Main class: ")
		end,
		projectRoot = vim.fn.getcwd(),
	},
}

dapui.setup()
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
require("nvim-dap-virtual-text").setup({})

vim.keymap.set("n", "<leader>dk", function()
	dap.continue()
end)
vim.keymap.set("n", "<leader>dl", function()
	dap.run_last()
end)
vim.keymap.set("n", "<leader>db", function()
	dap.toggle_breakpoint()
end)
vim.keymap.set("n", "<leader>dB", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
vim.keymap.set("n", "<leader>dlp", function()
	dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
vim.keymap.set("n", "<leader>dn", function()
	dap.step_over()
end)
vim.keymap.set("n", "<leader>ds", function()
	dap.step_into()
end)
vim.keymap.set("n", "<leader>do", function()
	dap.step_out()
end)
vim.keymap.set("n", "<leader>dc", function()
	dapui.close()
end)

-- vimtex
vim.g.latex_view_general_viewer = "zathura"
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_indent_on_ampersands = 0
vim.api.nvim_set_keymap("i", "<C-|>", "<plug>(vimtex-delim-close)", { noremap = true }) -- set this to something I can't type, essentially just remove it

-- R
require("cmp_r").setup({})

-- notify & noice
vim.notify = require("notify")
require("noice").setup({
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
		},
	},
	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = true, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
	-- Disable ltex spam
	routes = {
		{
			filter = {
				event = "lsp",
				kind = "progress",
				cond = function(message)
					local client = vim.tbl_get(message.opts, "progress", "client")
					return client == "ltex"
				end,
			},
			opts = { skip = true },
		},
	},
})

-- toggleterm
require("toggleterm").setup({
	open_mapping = [[<c-\>]],
	insert_mappings = false,
	terminal_mappings = false,
	direction = "horizontal",
	close_on_exit = false,
})

-- overseer
require("overseer").setup({
	strategy = {
		"toggleterm",
		use_shell = true,
		direction = "horizontal",
		close_on_exit = false,
		quit_on_exit = "success",
		hidden = false,
	},
})

-- cmake-tools
require("cmake-tools").setup({
	cmake_build_directory = "build",
	cmake_compile_commands_options = {
		action = "lsp",
	},
	cmake_executor = {
		name = "overseer",
		opts = {
			new_task_opts = {
				strategy = {
					"toggleterm",
					direction = "horizontal",
					auto_scroll = true,
					quit_on_exit = "success",
				},
			}, -- options to pass into the `overseer.new_task` command
			on_new_task = function(_) end,
		},
	},
	cmake_runner = {
		name = "overseer",
		opts = {
			new_task_opts = {
				strategy = {
					"toggleterm",
					direction = "horizontal",
					auto_scroll = true,
					quit_on_exit = "success",
				},
			}, -- options to pass into the `overseer.new_task` command
			on_new_task = function(_) end,
		},
	},
})
