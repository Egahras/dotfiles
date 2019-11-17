" Vim Config by Mike Sarhage
" Basic Settings
set encoding=utf-8 nobomb       " Use UTF-8 without BOM

set nocompatible

" Disable arrow movement, resize splits instead.
let g:elite_mode=1

if get(g:, 'elite_mode')
    nnoremap <Up>    :resize +2<CR>
    nnoremap <Down>  :resize -2<CR>
    nnoremap <Left>  :vertical resize +2<CR>
    nnoremap <Right> :vertical resize -2<CR>
endif

" enable syntax and plugins (for netrw)
syntax enable

" colorsheme that should be used.
colorscheme molokai
" colorscheme magicka

if has("autocmd")
    filetype plugin indent on
    "           │     │    └──── Enable file type detection
    "           │     └───────── Enable loading of indent
    "           └─────────────── Enable loading of pugin files
endif


" Line Numbers
set number
set relativenumber "Show line numbers relative to cvursor position

" show invisible characters
set list
set listchars=tab:▸\           " ┐
set listchars+=trail:·         " │ Use custom symbols to
set listchars+=eol:↴           " │ represent invisible characters
set listchars+=nbsp:_          " ┘

" Color Cursorsline
set cursorline

" Auto indenting
set autoindent

" Tabs -> 4 Spaces
set tabstop=4
set shiftwidth=4
"set expandtab					if this is activated tabs will be replaced by whiteSpaces

" Show Current file name
set statusline=2

"" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

"" File Browsing
let g:netrw_banner=0	" disable huge banner
let g:netrw_liststyle=3 " tree view

"" Mappings
" jump to Definition of Tag
nnoremap ü <C-]>
nnoremap Ü <C-O>

" moving splits with ctrl + h,j,k,l
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"" Plugins

" Specify a directory for plugins
" " - For Neovim: ~/.local/share/nvim/plugged
" " - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	" Use release branch (Recommend)
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	
	" Or latest tag
	Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
	" Or build from source code by use yarn: https://yarnpkg.com
	Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
	Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

call plug#end()

	" coc.vim configurations to make it even better.
	" Some servers have issues with backup files, see #649
	set nobackup
	set nowritebackup

	" Better display for messages
	set cmdheight=2
	" You will have bad experience for diagnostic messages when it's default 4000.
	set updatetime=300
" Use tab for trigger completion with characters ahead and navigate.
	" Use command ':verbose imap <tab>' to make sure tab is not mapped by other
	" plugin.
	inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~# '\s'
	endfunction
