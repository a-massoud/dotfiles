vim.g.mapleader = ' '

vim.call('plug#begin')

-- surround.vim
vim.fn['plug#']('tpope/vim-surround')

-- commentary.vim
vim.fn['plug#']('tpope/vim-commentary')

-- editorconfig
vim.fn['plug#']('editorconfig/editorconfig-vim')

-- repeat
vim.fn['plug#']('tpope/vim-repeat')

-- date/time
vim.fn['plug#']('tpope/vim-speeddating')

-- fugitive
vim.fn['plug#']('tpope/vim-fugitive')

-- lastplace
vim.fn['plug#']('farmergreg/vim-lastplace')

-- airline
if (os.getenv('DISPLAY') ~= nil) then
    vim.fn['plug#']('vim-airline/vim-airline')
    vim.fn['plug#']('vim-airline/vim-airline-themes')
end

-- telescope
vim.fn['plug#']('nvim-lua/plenary.nvim')
vim.fn['plug#']('ryanoasis/vim-devicons')
vim.fn['plug#']('nvim-telescope/telescope.nvim', { branch = '0.1.x' })
vim.fn['plug#']('nvim-telescope/telescope-file-browser.nvim')

-- onedark color scheme
vim.fn['plug#']('joshdick/onedark.vim')

-- tables
vim.fn['plug#']('dhruvasagar/vim-table-mode')

-- utl
vim.fn['plug#']('vim-scripts/utl.vim')

-- snippets
vim.fn['plug#']('SirVer/ultisnips')

-- lsp
vim.fn['plug#']('neovim/nvim-lspconfig')
vim.fn['plug#']('hrsh7th/cmp-nvim-lsp')
vim.fn['plug#']('hrsh7th/cmp-buffer')
vim.fn['plug#']('hrsh7th/cmp-path')
vim.fn['plug#']('hrsh7th/cmp-cmdline')
vim.fn['plug#']('hrsh7th/nvim-cmp')
vim.fn['plug#']('quangnguyen30192/cmp-nvim-ultisnips')

-- jdtls
vim.fn['plug#']('mfussenegger/nvim-jdtls')

-- tex
vim.fn['plug#']('lervag/vimtex')

-- emmet
vim.fn['plug#']('mattn/emmet-vim')

vim.call('plug#end')

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

-- airline
vim.g.bufferline_echo = 0
if (os.getenv('DISPLAY') ~= nil) then
    vim.opt.showmode = false
    vim.g.airline_theme = 'onedark'
    vim.g.airline_powerline_fonts = 1
    vim.g['airline#extensions#tabline#enabled'] = 1
    vim.g['airline#extensions#tabline#show_close_button'] = 0
    vim.g['airline#extensions#tabline#tabs_label'] = ''
    vim.g['airline#extensions#tabline#buffers_label'] = ''
    vim.g['airline#extensions#tabline#fnamemod'] = ':t'
    vim.g['airline#extensions#tabline#show_tab_count'] = 0
    vim.g['airline#extensions#tabline#show_buffers'] = 0
    vim.g['airline#extensions#tabline#show_splits'] = 0
    vim.g['airline#extensions#tabline#show_tab_nr'] = 0
    vim.g['airline#extensions#tabline#show_tab_type'] = 0
    vim.g['airline#extensions#tabline#tab_min_count'] = 2
else
    vim.opt.showmode = true
end

-- syntax
vim.opt.cursorline = true
vim.g.onedark_terminal_italic = 1
vim.cmd('colorscheme onedark')
vim.opt.bg = 'dark'
vim.env['NVIM_TUI_ENABLE_TRUE_COLOR'] = '1'
if (vim.fn.has('termguicolors')) then
    vim.opt.termguicolors = true
end

-- no line numbers in terminal
vim.api.nvim_create_autocmd({ 'TermOpen' }, {
    pattern = '*',
    callback = function(ev)
        vim.opt.number = false
        vim.opt.relativenumber = false
    end
})

-- telescope
require('telescope').setup {
    extensions = {
        file_browser = {
            hijack_netrw = true,
            respect_gitignore = false
        }
    }
}
require('telescope').load_extension 'file_browser'

vim.api.nvim_set_keymap(
    'n',
    '<leader>ff',
    '<cmd>Telescope find_files hidden=true no_ignore=true no_ignore_parent=true<cr>',
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

-- F3 & F4 to turn off and on, respectively, normal text wrapping
vim.api.nvim_set_keymap(
    '',
    '<F3>',
    '<cmd>set fo-=t<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'i',
    '<F3>',
    '<Esc><cmd>set fo-=t<CR>a',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    '',
    '<F3>',
    '<cmd>set fo+=t<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'i',
    '<F3>',
    '<Esc><cmd>set fo+=t<CR>a',
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
lspconfig.tsserver.setup { capabilities = capabilities }
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
lspconfig.clangd.setup { capabilities = capabilities }
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
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>fmt', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})

vim.api.nvim_set_keymap(
    'n',
    '<space>gr',
    '<cmd>Telescope lsp_references<cr>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<space>gd',
    '<cmd>Telescope lsp_definitions<cr>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<space>gi',
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

-- python venvs
if vim.fn.exists("$VIRTUAL_ENV") == 1 then
    vim.g.python3_host_prog = vim.fn.substitute(
        vim.fn.system("which -a python3 | head -n2 | tail -n1"), "\n", "", "g")
else
    vim.g.python3_host_prog = vim.fn
        .substitute(vim.fn.system("which python3"), "\n", "", "g")
end



-- vimtex
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_compiler_latexmk = {
    out_dir = './out'
}
