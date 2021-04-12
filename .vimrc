" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Bail out if something that ran earlier, e.g. a system wide vimrc, does not
" want Vim to use these default values.
if exists('skip_defaults_vim')
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Avoid side effects when it was already reset.
if &compatible
  set nocompatible
endif

" turn filetype detection off 
" filetype off                  

" When the +eval feature is missing, the set command above will be skipped.
" Use a trick to reset compatible only when the +eval feature is missing.
silent! while 0
  set nocompatible
silent! endwhile


call plug#begin('~/.vim/plugged')

" The following are examples of different formats supported.
" Keep Plug commands between plug#begin/end.
" plugin from http://vim-scripts.org/vim/scripts.html
" Plug 'L9'
" git repos on your local machine (i.e. when working on your own plugin)
"Plug 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plug 'ascenator/L9', {'name': 'newL9'}

" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
" Git plugin not hosted on GitHub
Plug 'https://github.com/wincent/command-t'
" Snippets engine.Snippets are seperate
Plug 'SirVer/ultisnips'
" Snippets by honza
Plug 'honza/vim-snippets'
" Airline Themes displayed on bottom
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" YouCompleteMe Plug also installed outside vundle
Plug 'Valloric/YouCompleteMe'
" Kure colorschemes
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'tomasiser/vim-code-dark'
Plug 'tpope/vim-vividchalk'
Plug 'nanotech/jellybeans.vim'
" Pairs of handy bracket mappings : vim colorscheme switching
Plug 'tpope/vim-unimpaired'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'xolox/vim-misc'
" Colorizer just like ColorHighlighter in sublime
Plug 'lilydjwg/colorizer'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'jelera/vim-javascript-syntax'
Plug 'morhetz/gruvbox'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'davidhalter/jedi-vim'
" Plug 'ervandew/supertab'
Plug 'vim-syntastic/syntastic'
Plug 'Valloric/YouCompleteMe', {'do': './install.py'}

" All of your Plugs must be added before the following line
call plug#end()

" for normal mode
nmap <silent> <F8> <Plug>MarkdownPreview
" for insert mode
imap <silent> <F8> <Plug>MarkdownPreview
" for normal mode
nmap <silent> <F9> <Plug>StopMarkdownPreview
" for insert mode
imap <silent> <F9> <Plug>StopMarkdownPreview

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PlugList       - lists configured plugins
" :PlugInstall    - installs plugins; append `!` to update or just :PlugUpdate
" :PlugSearch foo - searches for foo; append `!` to refresh local cache
" :PlugClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plug stuff after this line


set laststatus=2				" Airline Bar
set wildmenu					" Default command line completion
set ffs=unix,dos,mac				" Set Unix as standard file type
syntax enable
set wrap					" Word Wrap
set formatoptions+=1				" Always wrap before 1-letter words
set number					" Line number
set showbreak=+++				" Prefix for wrapped lines
set showmatch					" Show matching brackets
set clipboard=unnamedplus
set clipboard+=autoselect			" Visual selected text in clipboard
set autoindent					" Auto indent
set smartindent					" Smart indent
set hlsearch					" Highlight search-results
set wrapscan					" Continue search from top when hitting bottom
set ignorecase					" Ignore case when searching
set background=dark
set mouse=a
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set cc=80
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" filetype plugin on
" execute pathogen#infect()


" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set history=200		" keep 200 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands

set ttimeout		" time out for key codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key

" Show @@@ in the last line if it is truncated.
set display=truncate

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5


" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let &t_Co = 256
let g:gruvbox_italic=1
colorscheme gruvbox
highlight ColorColumn ctermbg=0 guibg=lightgrey

set pastetoggle=<F3>
let g:airline_solarized_bg='dark'
" Trigger configuration for YCM along with US. Do not use <tab> if you use YCM
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" Place cursor at last edited position
augroup resCur
  	autocmd!
	autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END
" open a new file in same path
nnoremap <leader>f :e %
" copy to cliboard
map <F11> :!xclip -f<CR>
map <F12> :r !xclip -o<CR>
" define max lines for colorizer to avoid pauses in large files
let g:colorizer_maxlines=2000

" Complete braces
autocmd BufRead *.java,*.cpp,*.c,*.py inoremap { {<CR>}<Esc>ko
" Show invisible chars
set lcs=tab:▸\ ,trail:·,nbsp:_
set list lcs=tab:\|\
" Dynamic search higlighting
set incsearch
" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
" No more whitespces
noremap <leader>ss :call StripWhitespace()<CR>
set ttyfast                    " Enable fast terminal connection.
" Exclude certain coloschemes while switching
let g:colorscheme_switcher_exclude = ['default', 'morning','oh-la-la','vividchalk']
let g:jellybeans_overrides = {
\    'background': { 'guibg': '000000' },
\}


" Do incremental searching when it's possible to timeout.
if has('reltime')
  set incsearch
endif

" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries.
if has('win32')
  set guioptions-=t
endif

" Don't use Ex mode, use Q for formatting.
" Revert with ":unmap Q".
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  " Revert with ":syntax off".
  syntax on

  " I like highlighting strings inside C comments.
  " Revert with ":unlet c_comment_strings".
  let c_comment_strings=1
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " Revert with ":filetype off".
  filetype plugin indent on

  " Put these in an autocmd group, so that you can revert them with:
  " ":augroup vimStartup | au! | augroup END"
  augroup vimStartup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

  augroup END

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If set (default), this may break plugins (but it's backward
  " compatible).
  set nolangremap
endif

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0 "used to be 1
let g:syntastic_check_on_open = 1 
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 0 "didnt have this line before
set runtimepath^=~/.vim/bundle/ctrlp.vim

"Enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let  g:C_UseTool_cmake = 'yes'
let  g:C_UseTool_doxygen = 'yes'

let s:hidden_all = 0

" let g:SuperTabDefaultCompletionType = 'context'

