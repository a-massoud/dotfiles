let mapleader=" "

call plug#begin('~/.vim/plugged')

" surround.vim
Plug 'tpope/vim-surround'

" commentary.vim
Plug 'tpope/vim-commentary'

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" airline
if ($TERM != 'linux')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
endif

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-telescope/telescope.nvim', {'branch': '0.1.x'}
Plug 'nvim-telescope/telescope-file-browser.nvim'

" gruvbox color scheme
Plug 'gruvbox-community/gruvbox'
Plug 'ellisonleao/gruvbox.nvim'

" texlive
Plug 'lervag/vimtex'

" polyglot
Plug 'sheerun/vim-polyglot'

" tree-sitter
if has('nvim-0.7')
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
endif

" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" tree-sitter
lua<<EOF
require'nvim-treesitter.configs'.setup {
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

    indent = {
        enable = true
    }
}
EOF

" vimtex
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_view_general_viewer = 'evince'

" editing options
set ts=4
set sw=4
set et
set si
set sta
set ai
set formatoptions=croqnj
set nojoinspaces
set tw=80
set title
set titlelen=0
set nofixeol
set delcombine

" search
set hls
set is
set ic
set scs

" filetypes
filetype on
filetype plugin on
filetype indent on

" swap files
set swf

" display
set enc=utf-8
set ruler
set laststatus=2
set showmatch
set matchtime=0
set showmode
set wildmenu
set number
set relativenumber

let g:bufferline_echo=0
" airline
if (!empty($DISPLAY))
    set noshowmode
    let g:airline_theme='gruvbox'
    let g:airline_powerline_fonts=1
    let g:airline#extensions#tabline#enabled=1
    let g:airline#extensions#tabline#show_close_button=0
    let g:airline#extensions#tabline#tabs_label=''
    let g:airline#extensions#tabline#buffers_label=''
    let g:airline#extensions#tabline#fnamemod=':t'
    let g:airline#extensions#tabline#show_tab_count=0
    let g:airline#extensions#tabline#show_buffers=0
    let g:airline#extensions#tabline#show_splits=0
    let g:airline#extensions#tabline#show_tab_nr=0
    let g:airline#extensions#tabline#show_tab_type=0
    let g:airline#extensions#tabline#tab_min_count=2
else
    set showmode
endif

" qol
set nojs

" syntax highlighting
set cursorline
syntax on
try
    colorscheme gruvbox
catch
endtry
set bg=dark
if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
    set termguicolors
endif

" autocmds
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
endif

augroup neovim_terminal
    autocmd!
    autocmd TermOpen * :set nonumber norelativenumber
augroup END

" telescope
lua<<EOF
require("telescope").setup {
    extensions = {
        file_browser = {
            hijack_netrw = true
        }
    }
}
require("telescope").load_extension "file_browser"
EOF
nnoremap <leader>ff <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>fg <cmd>Telescope live_grep hidden=true<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fn <cmd>Telescope file_browser<cr>

" press F2 to toggle search highlighting
noremap <F2> :nohl<CR>
inoremap <F2> <Esc>:nohl<CR>a

" press F3 & F4 to turn off and on normal text wrapping
noremap <F3> :set fo-=t<CR>
inoremap <F3> <Esc>:set fo-=t<CR>a
noremap <F4> :set fo+=t<CR>
inoremap <F4> <Esc>:set fo+=t<CR>a

" Press F7 to toggle line numbers
noremap <F7> :set number! relativenumber!<CR>
inoremap <F7> <Esc>:set number! relativenumber!<CR>

" +----------+
" | coc.nvim |
" +----------+

" danger
set nobackup
set nowritebackup

" timing
set updatetime=300

" signcolumn
set signcolumn=yes

" use <c-space> to trigger complete
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" make coc enter-aware
inoremap <silent><expr> <CR> "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" documentation
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction

" highlight symbol when holding cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" renaming
nmap <leader>rn <Plug>(coc-rename)

" format code
xmap <leader>ft  <Plug>(coc-format-selected)
nmap <leader>ft  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" apply action
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" apply action to current buffer
nmap <leader>ac  <Plug>(coc-codeaction)
" autofix
nmap <leader>qf  <Plug>(coc-fix-current)

" code lens action
nmap <leader>cl  <Plug>(coc-codelens-action)

" function & class objects
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" <C-f> and <C-b> for scrolling
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" C-s for selections ranges
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" statusline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
