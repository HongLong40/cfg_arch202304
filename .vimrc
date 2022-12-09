" ----------------------------------------------------------------------------
"   .vimrc for Linux BEL7876302D
" ----------------------------------------------------------------------------
set encoding=utf-8
scriptencoding utf-8
filetype indent on
set hidden
set nocompatible
set noshowmode
set clipboard^=unnamed,unnamedplus

syntax on

" ----------------------------------------------------------------------------
"   Color scheme, highlights, font and cursors
" ----------------------------------------------------------------------------
colorscheme industry
highlight Normal guifg=#cfcfcf guibg=#01101c ctermbg=234
highlight LineNr guifg=DarkYellow
highlight CursorLineNr gui=none guifg=red cterm=none ctermfg=darkred
highlight CursorLine guibg=Grey15 cterm=none ctermbg=18
highlight iCursor guifg=bg guibg=red
highlight Folded  term=standout ctermfg=11 ctermbg=8 guifg=DarkRed guibg=DarkGrey
highlight MatchParen guibg=DarkBlue
highlight SpecialKey guifg=orange
highlight StatusLine gui=reverse guifg=#00bb00 cterm=reverse ctermfg=DarkGreen

set cursorline
set scrolloff=5

set guifont=JetBrains\ Mono\ Light\ 12
set guicursor=n-v-c:block-Cursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:hor10-iCursor,r-cr:hor20-iCursor,a:blinkon0

" ----------------------------------------------------------------------------
"   Global variables
" ----------------------------------------------------------------------------
let g:rainbow_active = 1
let g:sql_type_default = 'sqlserver'

" ----------------------------------------------------------------------------
"   netrw defaults (no banner, tree list)
" ----------------------------------------------------------------------------
let g:netrw_banner = 0
let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25
"#augroup ProjectDrawer
"#  autocmd!
"#  autocmd VimEnter * :Vexplore
"#augroup END 0

" ----------------------------------------------------------------------------
"   Mappings
" ----------------------------------------------------------------------------
let mapleader = " "
nnoremap <silent> <leader>cc :set invcursorcolumn
nnoremap <silent> <leader>nn :set invnumber invrelativenumber
nnoremap <silent> <leader>rt :RainbowToggle
nnoremap <silent> <leader>sc :set invlist
nnoremap <silent> <leader>w  :w
nnoremap gb :ls:b 
nnoremap <silent> td :s/\[ \]/\[✓\]/j
nnoremap <silent> tu :s/\[✓\]/\[ \]/
nnoremap ; :
vnoremap ; :
vnoremap <silent> td :s/\[ \]/\[✓\]/
vnoremap <silent> tu :s/\[✓\]/\[ \]/
"map <esc>[1;5D <C-Left>
"map <esc>[1;5C <C-Right>
"imap <esc>[1;5D <C-Left>
"imap <esc>[1;5C <C-Right>

" ----------------------------------------------------------------------------
"   Status Line (will be using powerline.vim plugin)
" ----------------------------------------------------------------------------
set laststatus=2
"set statusline=
"set statusline+=\ %n\ -\ %<%f%h%M
"set statusline+=%=
"set statusline+=%{&fileencoding?&fileencoding:&encoding}
"set statusline+=:%{&fileformat}\ %y
"set statusline+=\ │\ %5.5l:%-3.3v
"set statusline+=\ 

" ----------------------------------------------------------------------------
"   Settings (general)
" ----------------------------------------------------------------------------
set splitbelow splitright
set title
set autoindent
set number relativenumber
set showmatch
set tabstop=4 softtabstop=4 smarttab shiftwidth=4 expandtab
set ignorecase smartcase
set backspace=indent,eol,start
set listchars=eol:¬,tab:⭾⋅,trail:~,extends:>,precedes:<,space:·
set notimeout ttimeout ttimeoutlen=100
set printoptions=left:20pt,right:20pt

" ----------------------------------------------------------------------------
"   Folding
" ----------------------------------------------------------------------------
set foldmethod=marker
set foldmarker=--{,--}

" ----------------------------------------------------------------------------
"   Abbreviations and Ligatures
" ----------------------------------------------------------------------------
iabbrev ... …
iabbrev ->  →
iabbrev bbb [ ]
iabbrev bvb [✓]

" ----------------------------------------------------------------------------
"   Enable modified arrow keys, see  :help arrow_modifiers
" ----------------------------------------------------------------------------
if !has('gui_running') && &term =~ '^\(alacritty\|xterm\)'
    execute "silent! set <xUp>=\<Esc>[@;*A"
    execute "silent! set <xDown>=\<Esc>[@;*B"
    execute "silent! set <xRight>=\<Esc>[@;*C"
    execute "silent! set <xLeft>=\<Esc>[@;*D"
endif

" ----------------------------------------------------------------------------
"   Window Navigation
" ----------------------------------------------------------------------------
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-a> ggVG

if has('gui_running')
    " toolbar and scrollbars
    set guioptions-=T     " remove toolbar
    set guioptions-=L     " left scroll bar
    set guioptions-=r     " right scroll bar
    set guioptions-=b     " bottom scroll bar
    set guioptions-=h     " only calculate bottom scroll size of current line
endif

