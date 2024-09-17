vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = ' '

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    'tpope/vim-surround',
    'tpope/vim-commentary',
    'tpope/vim-repeat',
    'tpope/vim-speeddating',
    'tpope/vim-fugitive',
    'farmergreg/vim-lastplace',
    'nvim-lualine/lualine.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',
    { 'nvim-telescope/telescope.nvim',   branch = '0.1.x' },
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    'nvim-telescope/telescope-file-browser.nvim',
    'lifepillar/vim-solarized8',
    'dhruvasagar/vim-table-mode',
    'vim-scripts/utl.vim',
    'SirVer/ultisnips',
    'neovim/nvim-lspconfig',
    'stevearc/conform.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'quangnguyen30192/cmp-nvim-ultisnips',
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio',
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    { 'mfussenegger/nvim-jdtls', dependencies = 'mfussenegger/nvim-dap' },
    { 'lervag/vimtex', lazy = false },
    'mattn/emmet-vim',
    'tikhomirov/vim-glsl',
    'norcalli/nvim-colorizer.lua',
    'barreiroleo/ltex_extra.nvim'
})

-- comentary: use single-line comments for c/c++
vim.api.nvim_create_autocmd({ 'FileType' }, {
    pattern = { 'c', 'cpp' },
    callback = function(ev)
        vim.opt.commentstring = '//%s'
    end
})

-- basic editing options
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.formatoptions = 'croqnj'
vim.opt.joinspaces = false
vim.opt.textwidth = 80
vim.opt.title = true
vim.opt.titlelen = 0
vim.opt.fixeol = false
vim.opt.delcombine = true
vim.opt.spell = false
vim.opt.spelllang = 'en_us,es_mx,fr,cjk'

-- search options
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- swap files
vim.opt.swapfile = true

-- display
vim.opt.encoding = 'utf-8'
vim.opt.ruler = true
vim.opt.laststatus = 2
vim.opt.showmatch = true
vim.opt.matchtime = 0
vim.opt.showmode = true
vim.opt.wildmenu = true
vim.opt.number = true
vim.opt.relativenumber = true

-- lualine
vim.g.bufferline_echo = 0
vim.opt.showmode = false
local lualine = require('lualine')
lualine.setup {
    options = { theme = 'solarized_light' }
}
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

-- syntax
vim.opt.cursorline = true
vim.opt.bg = 'light'
vim.env['NVIM_TUI_ENABLE_TRUE_COLOR'] = '1'
if (vim.fn.has('termguicolors')) then
    vim.opt.termguicolors = true
end
-- vim.g.neosolarized_contrast = 'normal'
-- vim.g.neosolarized_visibility = 'normal'
-- vim.g.neosolarized_vertSplitBgTrans = 1
-- vim.g.neosolarized_bold = 1
-- vim.g.neosolarized_underline = 1
-- vim.g.neosolarized_italic = 1
-- vim.g.neosolarized_termBoldAsBright = 1

-- vim.cmd('colorscheme NeoSolarized')
vim.cmd('colorscheme solarized8')

-- colorizer
require 'colorizer'.setup()

-- treesitter
require('nvim-treesitter.configs').setup {
    ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query' },
    sync_install = false,
    auto_install = true,
    ignore_install = {},
    highlight = {
        enable = true,
        disable = { 'tex', 'latex' }
    },
    indent = {
        enable = true
    }
}

-- nvim-tree
require('nvim-tree').setup {}
vim.api.nvim_set_keymap(
    'n',
    '<F4>',
    '<cmd>NvimTreeToggle<cr>',
    { noremap = true }
)

-- telescope
local fb_actions = require "telescope".extensions.file_browser.actions
require('telescope').setup {
    extensions = {
        file_browser = {
            hijack_netrw = true,
            respect_gitignore = false,
            mappings = {
                ['i'] = {
                    ['<A-CR>'] = fb_actions.create_from_prompt
                }
            }
        }
    }
}
require('telescope').load_extension 'file_browser'

vim.api.nvim_set_keymap(
    'n',
    '<leader>ff',
    '<cmd>Telescope find_files hidden=true<cr>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>fg',
    '<cmd>Telescope live_grep hidden=true<cr>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>fb',
    '<cmd>Telescope buffers<cr>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>fh',
    '<cmd>Telescope help_tags<cr>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>fn',
    '<cmd>Telescope file_browser<cr>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>fc',
    '<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>',
    { noremap = true }
)

-- F2 to toggle search highlighting
vim.api.nvim_set_keymap(
    '',
    '<F2>',
    '<cmd>nohl<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'i',
    '<F2>',
    '<Esc><cmd>nohl<CR>a',
    { noremap = true }
)

-- F5 to switch rl
vim.api.nvim_set_keymap(
    '',
    '<F5>',
    '<cmd>set rl!<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'i',
    '<F5>',
    '<Esc><cmd>set rl!<CR>a',
    { noremap = true }
)

-- F5 to switch arab
vim.api.nvim_set_keymap(
    '',
    '<F6>',
    '<cmd>set arab!<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'i',
    '<F6>',
    '<Esc><cmd>set arab!<CR>a',
    { noremap = true }
)

-- ultisnips
vim.g.UltiSnipsExpandTrigger = '<tab>'
vim.g.UltiSnipsJumpForwardTrigger = '<c-w>'
vim.g.UltiSnipsJumpBackwardTrigger = '<c-q>'

-- nvim-cmp.
local cmp = require 'cmp'

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn['UltiSnips#Anon'](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'ultisnips' }, -- For ultisnips users.
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- lspconfig
vim.opt.signcolumn = 'yes'
-- Setup language servers.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
lspconfig.pyright.setup { capabilities = capabilities }
lspconfig.ts_ls.setup { capabilities = capabilities }
lspconfig.jsonls.setup { capabilities = capabilities }
lspconfig.rust_analyzer.setup {
    settings = {
        ['rust-analyzer'] = {
            imports = {
                granularity = {
                    group = 'module'
                },
            },
        },
    },
    capabilities = capabilities
}
lspconfig.clangd.setup {
    cmd = { 'clangd', '--background-index', '--header-insertion=never' },
    capabilities = capabilities
}
vim.api.nvim_set_keymap('n', 'gh', '<cmd>ClangdSwitchSourceHeader<CR>', { noremap = true })
lspconfig.cmake.setup { capabilities = capabilities }
lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file('', true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
    capabilities = capabilities
}
lspconfig.texlab.setup { capabilities = capabilities }
lspconfig.html.setup { capabilities = capabilities }

-- spellcheck
lspconfig.ltex.setup {
    settings = {
        ltex = {
            language = 'en-US',
            dictionary = {
                ['en-US'] = { 'Massoud' },
                es = { 'Massoud' },
                fr = { 'Massoud' }
            },
            disabledRules = { fr = { 'FRENCH_WHITESPACE' } }
        }
    },
    on_attach = function(client, bufnr)
        require('ltex_extra').setup {
            load_langs = { 'en-US', 'es', 'fr', 'ar' },
            path = vim.fn.expand('~') .. '/.local/share/ltex'
        }
    end,
    capabilities = capabilities
}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        -- vim.keymap.set('n', '<space>fmt', function()
        --     vim.lsp.buf.format { async = true }
        -- end, opts)
    end,
})

vim.api.nvim_set_keymap(
    'n',
    'gr',
    '<cmd>Telescope lsp_references<cr>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    'gd',
    '<cmd>Telescope lsp_definitions<cr>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    'gi',
    '<cmd>Telescope lsp_implementations<cr>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<space>fs',
    '<cmd>Telescope lsp_workspace_symbols<cr>',
    { noremap = true }
)


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        -- disable virtual text
        virtual_text = true,

        -- show signs
        signs = true,

        -- delay update diagnostics
        update_in_insert = true,
        -- display_diagnostic_autocmds = { "InsertLeave" },

    }
)

-- conform (formatters)
require('conform').setup({
    formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'isort', 'black' },
        rust = { 'rustfmt', lsp_format = 'fallback' },
        javascript = { 'prettierd', 'prettier', stop_after_first = true, lsp_format = 'fallback' },
        typescript = { 'prettierd', 'prettier', stop_after_first = true, lsp_format = 'fallback' },
        c = { 'clang-format' },
        cpp = { 'clang-format' },
        java = { lsp_format = 'prefer' },
        cmake = { 'cmake_format' },
        html = { 'djlint' }
    }
})

vim.keymap.set('n', '<space>fmt', function()
    require('conform').format({bufnr = 0})
end)

-- python venvs
if vim.fn.exists("$VIRTUAL_ENV") == 1 then
    vim.g.python3_host_prog = vim.fn.substitute(
        vim.fn.system("which -a python3 | head -n2 | tail -n1"), "\n", "", "g")
else
    vim.g.python3_host_prog = vim.fn
        .substitute(vim.fn.system("which python3"), "\n", "", "g")
end

-- nvim-dap
local dap, dapui = require('dap'), require('dapui')
dap.adapters.codelldb = {
    type = 'server',
    port = '${port}',
    executable = {
        command = '/usr/bin/codelldb',
        args = { '--port', '${port}' }
    },
    name = 'codelldb'
}
dap.adapters.cpp = dap.adapters.codelldb
dap.adapters.c = dap.adapters.codelldb
dap.adapters.rust = dap.adapters.codelldb

dap.adapters.python = {
    type = 'executable',
    command = '/usr/bin/python',
    args = { '-m', 'debugpy.adapter' }
}

dap.configurations.python = {
    {
        type = 'python',
        request = 'launch',
        name = 'Launch file',
        program = '${file}',
        pythonPath = vim.g.python3_host_prog
    }
}
dap.configurations.cpp = {
    {
        name = 'Launch Codelldb',
        type = 'codelldb',
        request = 'launch',
        program = function()
            return vim.fn.input(
                'Path to executable: ',
                vim.fn.getcwd() .. '/',
                'file'
            )
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
        runInTerminal = false
    }
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

dapui.setup()
dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end
require('nvim-dap-virtual-text').setup {}

vim.keymap.set(
    'n',
    '<leader>dk',
    function()
        require('dap').continue()
    end
)
vim.keymap.set(
    'n',
    '<leader>dl',
    function()
        require('dap').run_last()
    end
)
vim.keymap.set(
    'n',
    '<leader>db',
    function()
        require('dap').toggle_breakpoint()
    end
)
vim.keymap.set(
    'n',
    '<leader>dB',
    function()
        require('dap').set_breakpoint(
            vim.fn.input('Breakpoint condition: ')
        )
    end
)
vim.keymap.set(
    'n',
    '<leader>dlp',
    function()
        require('dap').set_breakpoint(
            nil,
            nil,
            vim.fn.input('Log point message: ')
        )
    end
)
vim.keymap.set(
    'n',
    '<leader>dn',
    function()
        require('dap').step_over()
    end
)
vim.keymap.set(
    'n',
    '<leader>ds',
    function()
        require('dap').step_into()
    end
)
vim.keymap.set(
    'n',
    '<leader>do',
    function()
        require('dap').step_out()
    end
)

-- vimtex
vim.g.latex_view_general_viewer = 'zathura'
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_compiler_latexmk = {
    out_dir = './out',
}
vim.g.vimtex_indent_on_ampersands = 0
vim.api.nvim_set_keymap('i', '<ctrl>-|', '<plug>(vimtex-delim-close)', { noremap = true }) -- set this to something I can't type, essentially just remove it
