" vim:fdm=marker

" Cheat sheet -----------------------------------------------------------
" {{{
" - :%bd - Will delete all buffers
" - "ay - Will copy content to register 'a'
"
" ===SPLITS===
" - Opening (:sp, :vs, CTRL+W_s, CTRL+W_v)
" - Closing (:q, <leading>+q)
"
" }}}

" Settings -------------------------------------------------------------

" Preamble {{{

" Neovim settings {{{
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'
" endif
" }}}

" Syntax highlighting {{{
set t_Co=256
set background=dark
if has("termguicolors")
	set termguicolors
endif
syntax on
colorscheme neodark
let g:lightline = {}
let g:lightline.colorscheme = 'neodark'
" }}}

" Mapleader {{{
let mapleader=","
" }}}

" Local directories {{{
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo
" }}}

" Set some junk {{{
set autochdir " Automatically changes the current working directory to that of the file being edited.
set noshowmatch " Hide matching brackets/braces/parentheses.
filetype plugin on
set autoindent " Copy indent from last line when starting new line
set backspace=indent,eol,start "Enable backspace in insert mode
set cursorline " Highlight current line
set colorcolumn= " Columns to highlight
set encoding=utf-8 nobomb " BOM often causes trouble
set foldcolumn=2 " Column to show folds
set foldenable " Enable folding
set foldlevel=0 " Close all folds by default
set foldmethod=syntax " Syntax are used to specify folds
set foldminlines=0 " Allow folding single lines
set foldnestmax=5 " Set max fold nesting level
set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words
set gdefault " By default add g flag to search/replace. Add g to toggle
set hidden " When a buffer is brought to foreground, remember undo history and marks
set history=1000 " Increase history from 20 default to 1000
set nohlsearch " Don't highlight searches
set ignorecase " Ignore case of searches
set incsearch " Show match for partly typed search command
set laststatus=2 " Always show status line
set lazyredraw " Don't redraw when we don't have to
set redrawtime=100
set magic " Enable extended regexes
set mouse=a " Enable mouse in all in all modes
set noerrorbells " Disable error bells
set nojoinspaces " Only insert single space after a '.', '?' and '!' with a join command
set noshowmode " Don't show the current mode (airline.vim takes care of us)
set nostartofline " Don't reset cursor to start of line when moving around
set nowrap " Do not wrap lines
set nu " Enable line numbers
set ofu=syntaxcomplete#Complete " Set omni-completion method
set regexpengine=1 " Use the old regular expression engine (it's faster for certain language syntaxes)
set report=0 " Show all changes
set ruler " Show the cursor position
set scrolloff=6 " Minimal number of screen lines to keep above and below the cursor.
set shell=/bin/sh " Use /bin/sh for executing shell commands
set tabstop=2 " Set how many spaces equal a tab.
set expandtab " Expand tabs to spaces
set shiftwidth=2 " The # of spaces for indenting
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces
set softtabstop=2 " Tab key results in 2 spaces
set shortmess=atI " Don't show the intro message when starting vim
set showtabline=2 " Always show tab bar
set sidescrolloff=3 " Start scrolling three columns before vertical border of window
set smartcase " Ignore 'ignorecase' if search pattern contains uppercase characters
set splitbelow " New window goes below
set splitright " New windows goes right
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll
set switchbuf=""
set title " Show the filename in the window title bar
set ttyfast " Send more characters at a given time
set undofile " Persistent Undo
if !has('nvim')
	set viminfo=%,'9999,s512,n~/.vim/viminfo " Restore buffer list, marks are remembered for 9999 files, registers up to 512Kb are remembered
endif
set visualbell " Use visual bell instead of audible bell (annoying)
set path +=** " Usage find 'filename' and press tab key also 'ls' shows list of recent opened files or :b 'substr' of file name and enter key
set clipboard=unnamed
set wildchar=<TAB> " Character for CLI expansion (TAB-completion)
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*
set wildmenu " Hitting TAB in command mode will show possible completions above command line
set wildmode=list:longest " Complete only until point of ambiguity
set winminheight=0 " Allow splits to be reduced to a single line
set wrapscan " Searches wrap around end of file
" }}}

" Spellcheck {{{
let g:myLang = 0
let g:myLangList = ['nospell', 'en_gb', 'ru_ru']
function! MySpellLang()
	"loop through languages
	if g:myLang == 0 | setlocal nospell | endif
	if g:myLang == 1 | let &l:spelllang = g:myLangList[g:myLang] | setlocal spell | endif
	if g:myLang == 2 | let &l:spelllang = g:myLangList[g:myLang] | setlocal spell | endif
	echomsg 'language:' g:myLangList[g:myLang]
	let g:myLang = g:myLang + 1
	if g:myLang >= len(g:myLangList) | let g:myLang = 0 | endif
endfunction
map <F7> :<C-U>call MySpellLang()<CR>
" }}}

" }}}


" Configuration -------------------------------------------------------------

" General {{{
augroup general_config
	autocmd!

	" Speed up viewport scrolling {{{
	nnoremap <C-e> 3<C-e>
	nnoremap <C-y> 3<C-y>
	" }}}

	" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l) {{{
	map <C-j> <C-W>j
	map <C-k> <C-W>k
	map <C-H> <C-W>h
	map <C-L> <C-W>l
	" }}}

	" Sudo write (,W) {{{
	noremap <leader>W :w !sudo tee %<CR>
	" }}}

	" Create the tags file {{{
	command! MakeTags !ctags -R .
	" - Use ^] to jump to tag under the cursor
	" - Use g^] for ambiguous tags
	" - Use ^t to jump back up the tag stack
	" }}}

	" Get output of shell commands {{{
	command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>
	" }}}

	" Remap :W to :w {{{
	command! W w
	" }}}

	" Hard to type things {{{
	iabbrev >> →
	iabbrev << ←
	iabbrev ^^ ↑
	iabbrev VV ↓
	iabbrev aa λ
	" }}}

	" Toggle show tabs and trailing spaces (,w) {{{
	set lcs=tab:›\ ,trail:·,eol:¬,nbsp:_
	set fcs=fold:-
	nnoremap <silent> <leader>w :set nolist!<CR>
	" }}}

	" Remap keys for auto-completion menu {{{
	inoremap <expr> <CR>   pumvisible() ? "\<C-y>" : "\<CR>"
	inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
	inoremap <expr> <Up>   pumvisible() ? "\<C-p>" : "\<Up>"
	" }}}

	" Paste toggle (,p) {{{
	set pastetoggle=<leader>p
	map <leader>p :set invpaste paste?<CR>
	" }}}

	" Open vimrc {{{
	nnoremap <leader>v :e ~/.vimrc <CR>
	nnoremap <leader>V :tabnew ~/.vimrc <CR>
	" }}}

	" Toggle relative line number {{{
	nmap <Leader>n :exec &rnu? "se rnu!" : "se rnu"<CR>
	" }}}

	" Yank from cursor to end of line {{{
	nnoremap Y y$
	" }}}

	" Search and replace word under cursor (,*) {{{
	nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>
	vnoremap <leader>* "hy:%s/\V<C-r>h//<left>
	" }}}

	" Strip trailing whitespace (,ww) {{{
	function! StripWhitespace () " {{{
		let save_cursor = getpos(".")
		let old_query = getreg('/')
		:%s/\s\+$//e
		call setpos('.', save_cursor)
		call setreg('/', old_query)
	endfunction " }}}
	noremap <leader>ww :call StripWhitespace ()<CR>
	" }}}

	" Join lines and restore cursor location (J) {{{
	nnoremap J mjJ`j
	" }}}

	" Toggle folds (<Space>) {{{
	nnoremap <silent> <space> :exe 'silent! normal! '.((foldclosed('.')>0)? 'zMzx' : 'zc')<CR>
	" }}}

	" Fix page up and down {{{
	map <PageUp> <C-U>
	map <PageDown> <C-D>
	imap <PageUp> <C-O><C-U>
	imap <PageDown> <C-O><C-D>
	" }}}

	" Relative numbers {{{
	set relativenumber " Use relative line numbers. Current line is still in status bar.
	au BufReadPost,BufNewFile * set relativenumber
	" }}}
augroup END
" }}}

" Jumping to tags {{{
augroup jump_to_tags
	autocmd!

	" Basically, <c-]> jumps to tags (like normal) and <c-\> opens the tag in a new
	" split instead.
	"
	" Both of them will align the destination line to the upper middle part of the
	" screen.  Both will pulse the cursor line so you can see where the hell you
	" are.  <c-\> will also fold everything in the buffer and then unfold just
	" enough for you to see the destination line.
	nnoremap <c-]> <c-]>mzzvzz15<c-e>`z:Pulse<cr>
	nnoremap <c-\> <c-w>v<c-]>mzzMzvzz15<c-e>`z:Pulse<cr>

	" Pulse Line (thanks Steve Losh)
	function! s:Pulse() " {{{
		redir => old_hi
		silent execute 'hi CursorLine'
		redir END
		let old_hi = split(old_hi, '\n')[0]
		let old_hi = substitute(old_hi, 'xxx', '', '')

		let steps = 8
		let width = 1
		let start = width
		let end = steps * width
		let color = 233

		for i in range(start, end, width)
			execute "hi CursorLine ctermbg=" . (color + i)
			redraw
			sleep 6m
		endfor
		for i in range(end, start, -1 * width)
			execute "hi CursorLine ctermbg=" . (color + i)
			redraw
			sleep 6m
		endfor

		execute 'hi ' . old_hi
	endfunction " }}}

	command! -nargs=0 Pulse call s:Pulse()
augroup END
" }}}

" Restore Cursor Position {{{
augroup restore_cursor
	autocmd!

	autocmd BufReadPost *
				\ if line("'\"") > 1 && line("'\"") <= line("$") |
				\   exe "normal! g`\"" |
				\ endif
augroup END
" }}}


" Filetypes -------------------------------------------------------------

" JavaScript {{{
augroup filetype_javascript
	autocmd!
	let g:javascript_conceal = 1
augroup END
" }}}

" JSON {{{
augroup filetype_json
	autocmd!
	au BufRead,BufNewFile *.json set ft=json syntax=javascript
augroup END
" }}}

" Markdown {{{
augroup filetype_markdown
	autocmd!
	let g:markdown_fenced_languages = ['ruby', 'html', 'javascript', 'css', 'erb=eruby.html', 'bash=sh']
augroup END
" }}}

" }}}

" Plugin Configuration -------------------------------------------------------------

" Airline.vim {{{
augroup airline_config
	autocmd!
	let g:airline_powerline_fonts = 1
	let g:airline_enable_syntastic = 1
	let g:airline#extensions#tabline#buffer_nr_format = '%s '
	let g:airline#extensions#tabline#buffer_nr_show = 1
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#fnamecollapse = 0
	let g:airline#extensions#tabline#fnamemod = ':t'
	nmap <leader>1 <Plug>AirlineSelectTab1
	nmap <leader>2 <Plug>AirlineSelectTab2
	nmap <leader>3 <Plug>AirlineSelectTab3
	nmap <leader>4 <Plug>AirlineSelectTab4
	nmap <leader>5 <Plug>AirlineSelectTab5
	nmap <leader>6 <Plug>AirlineSelectTab6
	nmap <leader>7 <Plug>AirlineSelectTab7
	nmap <leader>8 <Plug>AirlineSelectTab8
	nmap <leader>9 <Plug>AirlineSelectTab9
augroup END
" }}}

" Syntastic.vim {{{
augroup syntastic_config
	autocmd!
	let g:syntastic_error_symbol = '✗'
	let g:syntastic_warning_symbol = '⚠'
	let g:syntastic_ruby_checkers = ['mri', 'rubocop']
augroup END
" }}}

" Tagbar.vim {{{
augroup tagbar_config
	autocmd!
	nmap <F8> :TagbarToggle<CR>
augroup END
" }}}

" Plugins -------------------------------------------------------------

" Load plugins {{{

" vim-plug (https://github.com/junegunn/vim-plug) settings
" Automatically install vim-plug and run PlugInstall if vim-plug not found
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'ap/vim-css-color'
Plug 'bling/vim-airline'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'digitaltoad/vim-pug', { 'for': 'pug' }
Plug 'editorconfig/editorconfig-vim'
Plug 'majutsushi/tagbar'
Plug 'valloric/youcompleteme'
Plug 'fatih/vim-go'
Plug 'ryanoasis/vim-devicons'
Plug 'KeitaNakamura/neodark.vim'

call plug#end()
" }}}
