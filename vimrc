" plugins
call plug#begin('~/.vim/plugged')

" buffer explorer
Plug 'jlanzarotta/bufexplorer'

" git integration
Plug 'tpope/vim-fugitive'

" tags integration
Plug 'ludovicchabant/vim-gutentags'

call plug#end()

" editing options
set ts=4
set sw=4
set et
set si
set sta
set ai
set formatoptions=tcroqn2j
set nojoinspaces
set tw=80
set title
set titlelen=0
set nofixeol

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

" qol
set nojs

" syntax highlighting
syntax on
try
    colorscheme default
catch
endtry
set bg=dark

" autocmds
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
endif

" press F9 to toggle search highlighting
noremap <F9> :nohl<CR>
inoremap <F9> <Esc>:nohl<CR>a

" press F7 & F8 to turn off and on normal text wrapping
noremap <F7> :set fo-=t<CR>
inoremap <F7> <Esc>:set fo-=t<CR>a
noremap <F8> :set fo+=t<CR>
inoremap <F8> <Esc>:set fo+=t<CR>a

" press g_CTRL-W to get wc output for selection/whole file
noremap g<C-W> :w !wc<CR>
inoremap g<C-W> <Esc>:w !wc<CR>
vnoremap g<C-W> :w !wc<CR>
