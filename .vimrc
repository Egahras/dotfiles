"" Vim Config by Mike Sarhage

"" Basic Settings
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

" Tabs -> 4 Spaces
" <C t> shift line to the right by 1 tab
" <C d> shift line to the left by 1 tab
set tabstop=4
set shiftwidth=4
"set expandtab					if this is activated tabs will be replaced by whiteSpaces

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
"
" " Make sure you use single quotes

Plug 'tpope/vim-commentary'			" Comment out with 'gc' or 'gcc'
Plug 'Valloric/YouCompleteMe'		" completion for everything!!!
Plug 'tobyS/pdv'					" php documentor -> used by <C-p>
Plug 'tobyS/vmustache'				" required by tobyS/pdv
Plug 'SirVer/ultisnips'				" required by tobyS/pdv
Plug 'vim-vdebug/vdebug'			" debug in vim - amazing
Plug 'vim-airline/vim-airline'		" better statusline
" Initialize plugin system
call plug#end()


"" PHP Documentor COnfiguration
"" tobyS/pdv
let g:pdv_template_dir = $HOME ."/.vim/plugged/pdv/templates_snip"
nnoremap <buffer> <C-p> :call pdv#DocumentWithSnip()<CR>
