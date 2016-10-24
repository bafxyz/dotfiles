"-------------------------------------------------
" PLUGINS
"-------------------------------------------------
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'editorconfig/editorconfig-vim'

Plugin 'godlygeek/tabular'

Plugin 'Chiel92/vim-autoformat'

Plugin 'mattn/emmet-vim'

Plugin 'tpope/vim-surround'

Plugin 'tpope/vim-fugitive'

Plugin 'scrooloose/syntastic'

Plugin 'valloric/youcompleteme'

" :StripWhitespace
Plugin 'ntpeters/vim-better-whitespace'

call vundle#end()            " required
filetype plugin indent on    " required


"-------------------------------------------------

" Disable Arrow keys in Escape mode
noremap <left> <nop>
noremap <down> <nop>
noremap <up> <nop>
noremap <rightt> <nop>

"-------------------------------------------------
" BASIC EDITING CONFIGURATION
"-------------------------------------------------

set ttyfast
set gdefault

set encoding=utf8
set termencoding=utf8
set fileencodings=utf8,cp1251,koi8r

set nocompatible
set showmode
set title
set showcmd

colorscheme kolor
set t_Co=256
set background=dark
set relativenumber
set wrap
set linebreak
set autoindent
set smartindent
set tabstop=2
set expandtab
set shiftwidth=2

" Provides tab complition for all relative tasks
" Usage find 'filename' and press tab key also 'ls' shows list of recent
" opened files or :b 'substr' of file name and enter key
set path +=**
set wildmenu " Enhance command-line completion
set clipboard=unnamed


set esckeys " Allow cursor keys in insert mode
set backspace=indent,eol,start " Allow backspace in insert mode

" Don’t add empty newlines at the end of files
set binary
set noeol

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Enable line numbers
set number

" Enable syntax highlighting
syntax on
"set list
"set listchars=tab:--
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Highlight current line
set cursorline
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
" set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Use relative line numbers
"if exists("&relativenumber")
"	set relativenumber
"	au BufReadPost * set relativenumber
"endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif