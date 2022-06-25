"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Sections:
" -> F0: General
" -> F1: VIM user interface
" -> F2: Colors and Fonts
" -> F3: Files and backups
" -> F4: Text, tab and indent related
" -> F5: Moving around, windows
" -> F6: Status line
" -> F7: Misc
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => F0: General {{{
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
" }}}

" => F1: VIM user interface {{{
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=.o,~,*.pyc
set wildignore+=.git*,.hg*,.svn*

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Show cmd in status line, Cmd like emacs
set showcmd
set timeoutlen=1000

" Display line number
set number
set relativenumber
" }}}

" => F2: Colors and Fonts {{{
" Enable syntax highlighting
syntax enable

" Set utf8 as standard encoding and en_US as the standard language
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Set backcolor
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black

" }}}

" => F3: Files, backups and undo {{{
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile
set updatetime=100
" }}}

" => F4: Text, tab and indent related {{{
" Use spaces instead of tabs
set expandtab
autocmd FileType make set noexpandtab

" Be smart when using tabs 😉
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

autocmd FileType vim set foldmethod=marker
autocmd FileType c set foldmethod=syntax
" }}}

" => F5: Moving around, windows {{{
" Map to / (search)
map <space> /

" Disable highlight when is pressed
map <silent> <leader><cr> :noh<cr>

" Specify the behavior when switching between buffers
try
set switchbuf=useopen,usetab,newtab
set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" }}}

" => F6: Status line {{{
" Always show the status line
set laststatus=2
" }}}

" => F7: Misc {{{
" Remove the Windows ^M - when the encodings gets messed up
function! RemoveLastM()
:%s/^M$//g
endfunction
" }}}
