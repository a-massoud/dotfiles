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
require("telescope").setup {
    extensions = {
        file_browser = {
            hijack_netrw = true
        }
    }
}
require("telescope").load_extension "file_browser"

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
