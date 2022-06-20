call plug#begin('~/.vim/plugged')

" surround.vim
Plug 'tpope/vim-surround'

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" airline
if (!empty($DISPLAY))
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
endif

" fzf
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" one dark theme
Plug 'joshdick/onedark.vim'


" polyglot
Plug 'sheerun/vim-polyglot'

call plug#end()

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
    let g:airline_theme='onedark'
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
let g:onedark_terminal_italic = 1
set cursorline
syntax on
try
    colorscheme onedark
catch
endtry
set bg=dark
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
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

" fzf
noremap <leader>t :Files<CR>
noremap <leader>b :Buffers<CR>
let g:fzf_preview_window=['right:50%', 'ctrl-/']

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
