call plug#begin('~/.vim/plugged')

" git integration
Plug 'tpope/vim-fugitive'

" surround.vim
Plug 'tpope/vim-surround'

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" completions
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" NERDTree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" fzf
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" more highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" tabular
Plug 'godlygeek/tabular'

Plug 'plasticboy/vim-markdown'

" Latex
Plug 'lervag/vimtex'

" snippets
" use coc-snippets
Plug 'honza/vim-snippets'

" debugging
Plug 'puremourning/vimspector'

" safe local vimrc
Plug 'embear/vim-localvimrc'

" nord theme
Plug 'arcticicestudio/nord-vim'

call plug#end()

" disable localvimrc sandbox - it asks anyway
let g:localvimrc_sandbox = 0

" markdown
let g:vim_markdown_folding_disabled = 1

" editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" latex
let g:tex_flavor = "latex"
let g:vimtex_compiler_method = "latexmk"
let g:vimtex_compiler_latexmk = {
            \ 'build_dir': 'out',
            \ 'callback': 1,
            \ 'continuous': 1,
            \ 'executable': 'latexmk',
            \ 'hooks': [],
            \ 'options': [
                \ '-verbose',
                \ '-file-line-error',
                \ '-synctex=1',
                \ '-interaction=nostopmode',
            \ ],
            \}
let g:vimtex_compiler_latexmk_engines = {
            \ '_': '-lualatex',
            \ 'pdflatex': '-pdf',
            \ 'dvipdfex': '-pdfdvi',
            \ 'lualatex': '-lualatex',
            \ 'xelatex': '-xelatex',
            \ 'context (pdftex)': '-pdf -pdflatex=texexec',
            \ 'context (luatex)': '-pdf -pdflatex=context',
            \ 'context (xetex)': '-pdf -pdflatex=''texexec --xtx''',
            \}
let g:vimtex_view_method = "general"
let g:vimtex_quickfix_mode = 2
let g:vimtex_quickfix_autoclose_after_keystrokes = 1

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
set noshowmode
let g:airline_theme='nord'
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

" qol
set nojs

" syntax highlighting
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
let g:nord_cursor_line_number_background = 1
set cursorline
syntax on
try
    colorscheme nord
catch
endtry
set bg=dark
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = true,
  }
}
EOF

" autocmds
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
endif

augroup neovim_terminal
    autocmd!
    autocmd TermOpen * :set nonumber norelativenumber
augroup END

" vimspector
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
nmap <Leader>db <Plug>VimspectorBreakpoints
nmap <Leader><Esc> :call vimspector#Reset()<CR>

" NERDTree
map <F1> :NERDTreeToggle<CR>
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeMinimalMenu=1

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

" coc.nvim stuff

" config file
let g:coc_config_home = '~/.local/share/nvim'

" snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
function! s:should_complete() abort
    if !exists('*complete_info')
        throw 'should_complete requires complete_info function to work'
    endif
    let selected = complete_info()['selected']
    if selected == -1
        return 0
    endif
    return 1
endfunction

inoremap <silent><expr> <cr> <SID>should_complete() ? "\<C-y>"
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup CocConfig
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" USING AIRLINE
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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
