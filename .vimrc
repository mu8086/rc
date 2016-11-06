set encoding=utf-8
set fileencodings=utf-8,cp950
set fileformats=unix	"^M

set t_Co=256
syntax on
set number
set background=dark
set backspace=2
highlight PreProc ctermfg=196


"set cindent
"set autoindent
set smartindent

set cmdheight=1

"Status Line
set laststatus=2
set statusline=Path:\ %F%m\ \ \ Line:\ %l/%L:%c\ \ \ Ascii:\ %b\ 0x%B
set ruler

set virtualedit=all

"Cursor Line
set cursorline
"highlight Cursor
highlight CursorLine ctermbg=238 cterm=bold

"Vi no compatible
set nocompatible

"Search
set incsearch
set hlsearch
set ignorecase
highlight Search ctermfg=White ctermbg=DarkBlue
"highlight Comment ctermfg=DarkCyan
"highlight Comment term=bold ctermfg=darkcyan guifg=LightBlue

"Word Wrap
set wrap
set linebreak

"Tab
set softtabstop=8
set tabstop=8
set shiftwidth=8
set noexpandtab

set confirm
set history=100

if has("autocmd")
"設定skeleton
"autocmd BufNewFile *.c 0r ~/.vim/skeleton.c
"autocmd BufNewFile *.cpp 0r ~/.vim/skeleton.cpp
"autocmd BufNewFile Makefile 0r ~/.vim/skeleton.makefile
"游標自動移到最後編輯離開的位置
autocmd BufRead *.txt set tw=78
autocmd BufReadPost *
\   if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal g'\"" |
\   endif
endif







"==============================

" Vim color file
" Maintainer:   Gerald S. Williams
" Last Change:  2003 Mar 20

" This is a dark version/opposite of "seashell". The cterm version of this is
" very similar to "evening".
"
" Only values that differ from defaults are specified.

set background=dark
hi clear
if exists("syntax_on")
syntax reset
endif
let g:colors_name = "BlackSea"

hi Normal guibg=Black guifg=seashell ctermfg=White
hi NonText guifg=LavenderBlush ctermfg=LightMagenta
hi DiffDelete guibg=DarkRed guifg=Black ctermbg=DarkRed ctermfg=White
hi DiffAdd guibg=DarkGreen ctermbg=DarkGreen ctermfg=White
hi DiffChange guibg=Gray30 ctermbg=DarkCyan ctermfg=White
hi DiffText gui=NONE guibg=DarkCyan ctermbg=DarkCyan ctermfg=Yellow
"hi Comment guifg=LightBlue
hi Constant guifg=DeepPink
hi PreProc guifg=Magenta ctermfg=Magenta
hi StatusLine guibg=#1f001f guifg=DarkSeaGreen cterm=NONE ctermfg=White ctermbg=240
hi StatusLineNC guifg=Gray
hi VertSplit guifg=Gray
hi Type gui=NONE
hi Identifier guifg=Cyan
hi Statement guifg=brown3 ctermfg=160 cterm=bold
hi Search guibg=Gold3 ctermfg=White


"==============================

highlight CursorLineNr ctermbg=238 cterm=bold
highlight CursorLine ctermbg=238 cterm=bold
highlight Search ctermfg=White ctermbg=DarkYellow
highlight Comment ctermfg=29 cterm=bold guifg=#00875f
highlight Type ctermfg=69


" hl-NonText:		eol, extends, precedes
" hl-SpecialKey:	nbsp, tab, trail
"set list
" show >------- present tab
set listchars=tab:>-,trail:\ 
hi SpecialKey ctermbg=102

" map C-H to nohighlightsearch
nnoremap <silent> <C-H> <C-H>:nohls<CR>

" map C-L to nolist
nnoremap <silent> <C-L> :set list!<CR>

nnoremap <silent> <C-P> :echo expand('%:p')<CR>

noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$
