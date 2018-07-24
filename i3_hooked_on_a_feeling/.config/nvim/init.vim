"
"                            Plugin Management                         "
"                    ==============================                    "

" Add the dein installation directory into runtimepath
set runtimepath^=~/.cache/dein/repos/github.com/Shougo/dein.vim/

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')
    call dein#add('~/.cache/dein')

"-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    call dein#add('lilydjwg/colorizer', { 'on_cmd': ['ColorHighlight'] })                                                                              " colorizer just like ColorHighlighter in sublime
    call dein#add('nanotech/jellybeans.vim')                                                                                                           " colorschemes
    call dein#add('PotatoesMaster/i3-vim-syntax')                                                                                                      " i3 syntax highlight
    call dein#add('euclio/vim-markdown-composer', { 'on_ft': ['markdown'] })                                                                           " live mardown preview
    call dein#add('triglav/vim-visual-increment', { 'on_func': ['VisualStarSearchSet(cmdtype,...)'] })                                                 " auto increment
    call dein#add('salsifis/vim-transpose', { 'on_cmd': ['Transpose', 'TransposeInteractive'] })                                                       " rows to cols and vice versa
    call dein#add('mbbill/undotree', { 'on_cmd': 'UndotreeToggle' })                                                                                   " interactive undos
    call dein#add('tmhedberg/matchit', { 'on_ft': ['html','xml','tex'] })                                                                              " match tags on_ft html, xml latex etc
    call dein#add('sunaku/vim-hicterm', { 'on_ft': ['sh','bash','zsh','vim'] })                                                                        " hightlight ansi colors
    call dein#add('itchyny/vim-gitbranch')                                                                                                             " branch name
    call dein#add('prettier/vim-prettier', { 'on_cmd': ['Prettier', 'PrettierAsync'] })                                                                " makes someone else read the goddamn code
    call dein#add('maksimr/vim-jsbeautify', { 'on_ft': ['html', 'javascript', 'css', 'javascript.jsx'] })                                              " makes someone else read the goddamn code
"-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

"-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    call dein#add('~/.fzf/')                                                                                                                           " master junegunn and his plugins
    call dein#add('junegunn/fzf.vim')                                                                                                                  " what a beauty
    call dein#add('junegunn/goyo.vim', { 'on_cmd': 'Goyo' })                                                                                           " centerify
    call dein#add('junegunn/limelight.vim', { 'on_cmd': 'Limelight' })                                                                                 " distraction free
    call dein#add('junegunn/vim-easy-align', { 'on_map': {'n' : ['gaip'], 'x' : 'ga'},'on_cmd': 'EasyAlign' })                                         " master and his works are too good
"-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

"-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    call dein#add('zchee/deoplete-jedi')                                                                                                               " python completion
	call dein#add('Shougo/deoplete.nvim')
	call dein#config('deoplete.nvim', {
	\ 'lazy' : 1, 'on_i' : 1,
	\ })
    call dein#add('Shougo/dein.vim')                                                                                                                   " async everything!!!
    call dein#add('Shougo/neosnippet.vim')                                                                                                             " snippets
    call dein#add('Shougo/neosnippet-snippets')                                                                                                        " whole collection
"-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

"-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    call dein#add('mattn/emmet-vim', { 'on_ft': ['html', 'css'] })                                                                                            " quick html
    call dein#add('tpope/vim-surround', { 'on_ft': ['html', 'javascript', 'css', 'javascript.jsx','java'], 'on_map': {'n' : ['cs', 'ds', 'ys'], 'x' : 'S'} }) " should come built in with vim
    call dein#add('tpope/vim-obsession', {'on_cmd': ['Obsess', 'Obsess!']})                                                                                   " save the session
    call dein#add('majutsushi/tagbar',{ 'on_cmd': ['TagbarToggle'], 'on_map': {'n': '<F8>','x': '<F8>'} })                                                    " views tags interactively
    call dein#add('w0rp/ale', { 'on_ft': ['html', 'css', 'javascript', 'js', 'javascript.jsx'] })                                                             " linter
    call dein#add('autozimu/LanguageClient-neovim', {
    \ 'rev': 'next',
    \ 'build': 'bash install.sh',
    \ })
"-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    call dein#end()
    call dein#save_state()
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" dein config
let g:dein#install_max_processes = 16
let g:dein#install_progress_type = 'echo'
let g:dein#enable_notification = 0


" Vim Indentline
let g:indentLine_enabled=1
let g:indentLine_color_term=239

" markdown preview
let g:markdown_composer_browser="qutebrowser"

" Limelight
let g:limelight_conceal_ctermfg=0

" Goyo
function! s:goyo_enter()
  "silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
endfunction

function! s:goyo_leave()
  "silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Goyo set F5 to goyo
nmap <F5> :Goyo<cr>

" Use deoplete.
let g:deoplete#enable_at_startup=1
let g:deoplete#enable_smart_case=1

" FZF FTW. MY GOD WHAT A PIECE OF WORK!!!!!
" This is the default extra key bindings
let g:fzf_action= {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout={ 'window': 'enew' }
let g:fzf_layout={ 'window': '-tabnew' }
let g:fzf_layout={ 'window': '10split enew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors=
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" explore current dir of  opened file
function! s:fzf_neighbouring_files()
  let current_file =expand("%")
  let cwd = fnamemodify(current_file, ':p:h')
  let command = 'rg --files --hidden -g "!{.git,node_modules,vendor}/" '.cwd

  call fzf#run({
        \ 'source': command,
        \ 'sink':   'tabnew',
        \ 'options': '-m -x +s',
        \ 'window':  'enew' })
endfunction

command! FZFNeigh call s:fzf_neighbouring_files()

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir='~/.local/share/fzf-history'

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" neosnippet key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

let g:neosnippet#enable_completed_snippet=1

" JsBeautifier using <C-F>
"autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
"autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
"autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>


" Key-mappings and Events Deoplete" {{{
" ---

" Movement within 'ins-completion-menu'
imap <expr><C-j>   pumvisible() ? "\<Down>" : "\<C-j>"
imap <expr><C-j>   pumvisible() ? "\<Up>" : "\<C-k>"

" Scroll pages in menu
inoremap <expr><C-f> pumvisible() ? "\<PageDown>" : "\<Right>"
inoremap <expr><C-b> pumvisible() ? "\<PageUp>" : "\<Left>"
imap     <expr><C-d> pumvisible() ? "\<PageDown>" : "\<C-d>"
imap     <expr><C-u> pumvisible() ? "\<PageUp>" : "\<C-u>"

" Undo completion
" inoremap <expr><C-g> deoplete#undo_completion()

" Redraw candidates
inoremap <expr><C-g> deoplete#refresh()
inoremap <expr><C-l> deoplete#complete_common_string()


" <Tab> completion:
" 1. If popup menu is visible, select and insert next item
" 2. Otherwise, if within a snippet, jump to next input
" 3. Otherwise, if preceding chars are whitespace, insert tab char
" 4. Otherwise, start manual autocomplete
imap <silent><expr><Tab> pumvisible() ? "\<Down>"
	\ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
	\ : (<SID>is_whitespace() ? "\<Tab>"
	\ : deoplete#manual_complete()))

smap <silent><expr><Tab> pumvisible() ? "\<Down>"
	\ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
	\ : (<SID>is_whitespace() ? "\<Tab>"
	\ : deoplete#manual_complete()))

inoremap <expr><S-Tab>  pumvisible() ? "\<Up>" : "\<C-h>"

function! s:is_whitespace() "{{{
	let col = col('.') - 1
	return ! col || getline('.')[col - 1] =~? '\s'
endfunction "}}}
" }}}

" for tagbar
noremap <F8> :TagbarToggle<CR>

" set everything up for js
" specify ale linting engine
let g:ale_linters = {
\   'javascript': ['prettier', 'eslint'],
\}

" In ~/.vim/vimrc, or somewhere similar.
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\}

" disable too much distraction by linting each time text changed
let g:ale_lint_on_text_changed = 'never'

" lint on save
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

" prettier config for linting
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma'
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1


" for automatic formatting on save
"autocmd bufwritepost *.js silent PrettierAsync
autocmd bufwritepost *.js silent ALEFix
set autoread

" single quotes over double quotes
" Prettier default: false
let g:prettier#config#single_quote = 'true'
" avoid|always
" Prettier default: avoid
let g:prettier#config#arrow_parens = 'always'
" number of spaces per indentation level
" Prettier default: 2
let g:prettier#config#tab_width = 2

" Required for operations modifying multiple buffers like rename.
set hidden

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" Minimal LSP configuration for JavaScript
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['~/node_modules/.bin/javascript-typescript-stdio'],
    \ }
" Use LanguageServer for omnifunc completion
autocmd FileType javascript setlocal omnifunc=LanguageClient#complete

" <leader>ld to go to definition
autocmd FileType javascript nnoremap <buffer>
  \ <leader>ld :call LanguageClient_textDocument_definition()<cr>
" <leader>lh for type info under cursor
autocmd FileType javascript nnoremap <buffer>
  \ <leader>lh :call LanguageClient_textDocument_hover()<cr>
" <leader>lr to rename variable under cursor
autocmd FileType javascript nnoremap <buffer>
  \ <leader>lr :call LanguageClient_textDocument_rename()<cr>
" <leader>lf to fuzzy find the symbols in the current document
autocmd FileType javascript nnoremap <buffer>
  \ <leader>lf :call LanguageClient_textDocument_documentSymbol()<cr>


" Latex remote server for nvim
let g:vimtex_compiler_progname = 'nvr'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Editor Settings                            "
"                    ==============================                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setting grepprg used by grep
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

set autoindent

" Word Wrap
set wrap
set formatoptions+=1				" Always wrap before 1-letter words
set showbreak=+++				" Prefix for wrapped lines
set wrapscan					" Continue search from top when hitting bottom

" replace  interactive
set inccommand=nosplit

" set shell
set shell=/bin/bash

" statusline
set laststatus=2

" Broken down into easily includeable segments

set nrformats=alpha             " for incrementing alpha
set ignorecase					" Ignore case when searching

" Setting colorscheme
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum" " set Vim-specific sequences for RGB colors
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
let &t_Co =256
let g:rehash256=1
set background=dark
set termguicolors                    " enable true colors support
colorscheme jellybeans

" Set encoding to utf8
set encoding=utf8

" Make autocomplete for filenames work
set path=**

" Turn on line numbers
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

" Highlight cursor line (slows down)
set nocursorline

" Auto read and write
set autowrite
set autoread

" Confirm before quit without save
set confirm

" Disable wrapping
set nowrap

" Better backup, swap and undos storage
set directory=~/.config/nvim/dirs/tmp     " directory to place swap files in
set backupdir=~/.config/nvim/dirs/backups " where to put backup files
set backup                                " make backup files
set undodir=~/.config/nvim/dirs/undodir   " undo directory
set undofile                              " persistent undos - undo after you re-open the file

" Allow mouse
set mouse=a

" Incremental search
set incsearch

" Highlighted search results
set hlsearch

" Smart search
set ignorecase

" Allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on

" Make backspace great again
set backspace=2

" Set split direction
set splitbelow
set splitright

" Set updatetime
" set updatetime=2000

" Default intent to 4 spaces ( auto switch based on type in code section )
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Show invisibles
set list
set listchars=tab:\ \ ,eol:¬,trail:⋅

" Show line breaks
set showbreak=↪

" When scrolling, keep cursor 5 lines away from screen border
set scrolloff=5

" Autocompletion of files and commands behaves like zsh
set wildmenu
set wildmode=full

" Setting up ignores
set wildignore=*/tmp/*,*.so,*.pyc,*.png,*.jpg,*.gif,*.jpeg,*.ico,*.pdf
set wildignore=*.wav,*.mp4,*.mp3
set wildignore=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*,*/.git/*
set wildignore=*.swp,*~,._*
set wildignore=_pycache_,.DS_Store,.vscode,.localized

" Indent based folding
set foldmethod=indent
set foldignore=
set foldlevelstart=10
set foldnestmax=10

" pasting options
set pastetoggle=<F3>

" Colors common
highlight NonText ctermfg=238 guifg=#444444

" Use italics for some text
highlight htmlArg gui=italic
highlight Comment gui=italic
highlight Type    gui=italic
highlight htmlArg cterm=italic
highlight Comment cterm=italic
highlight Type    cterm=italic

" Smart colorcolumn
"autocmd BufEnter * call matchadd('ColorColumn', '\%160v', 100)

" Better coloring for errors
highlight clear SpellBad
highlight SpellBad cterm=underline gui=underline ctermfg=11 guifg=#ffff00

" Don't you f'in touch my cursor
"set guicursor=

" Completefunc
autocmd BufEnter * set completefunc=cm#_completefunc

" Resize panes whenever containing window resized.
autocmd VimResized * wincmd=

" Make sure it is javascript
augroup Filetype javascript syntax=javascript

" Make vim edit crontab
autocmd filetype crontab setlocal nobackup nowritebackup

" Remove whitespace at save
autocmd BufWritePre *.py,*.css,*.js,*.html,*.cpp,*.c,*.java,*.go,*.rs,*.ts,*.cljs,*.clj :%s/\s\+$//e

" Place cursor at last edited position
augroup resCur
  	autocmd!
	autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" set spell check on for markdown and markup files
augroup markdownSpell
    autocmd!
    autocmd FileType markdown setlocal spell
    autocmd BufRead,BufNewFile *.md,*.html setlocal spell
augroup END

" launch nvim with man
augroup manlaunchtoc
    autocmd!
    if has('nvim')
        autocmd FileType man
            \ call man#show_toc() |
            \ setlocal laststatus=0 nonumber norelativenumber |
            \ nnoremap <buffer> l <Enter> |
            \ wincmd H |
            \ vert resize 35 |
            \ wincmd p
    endif
augroup end


" tabs for different files
augroup indents
	autocmd!
	autocmd FileType less,css,html setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType text,markdown setlocal expandtab
	autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Key remaps                             "
"                    ==============================                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" to use lines from current buffers quickly
" ctrl-x+ctrl-l
imap <c-x><c-l> <plug>(fzf-complete-line) 

" replace vim's built-in visual * and # behavior
xnoremap * :<C-u>call VisualStarSearchSet('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call VisualStarSearchSet('?')<CR>?<C-R>=@/<CR><CR>

" seperator - lines at beg and end of a para
nmap <leader>pp :call AddComments()<CR>

" a simple remap to cause less annoyance by not moving the cursor
nnoremap * *<c-o>
nnoremap # #<c-o>

" Navigating with guides
inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
map <Space><Tab> <Esc>/<++><Enter>"_c4l
inoremap ;gui <++>

" lets define some useful shortcuts 
nnoremap <leader>di :normal! :w:source %:call dein#install()<CR>
nnoremap <leader>du :normal! :w:source	 %:call dein#update()<cr>
nnoremap <leader>dd :map(dein#check_clean(), "delete(v:val, 'rf')")<cr>
nnoremap <leader>op :silent! update<Bar>silent! !chromium %:p &<CR>
nnoremap <leader>ps :normal! mm{Oji"205A-}oki"205A-`m^[<cr>
nmap <leader>hd :Emmet div>p#foo$*4>a<CR>
nmap <leader>ha :call emmet#anchorizeURL(0)<CR>
nmap <leader>hq :call emmet#anchorizeURL(1)<CR>
" tab makes it easier than two keystrokes
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
" for correcting spelling and move to where cur was before
nnoremap <leader>sp :normal! mm[s1z=`m<cr>
nnoremap <leader>so :w<cr>:source %<cr>
nnoremap <leader>hbh :call HtmlBeautify()<cr>
" save and add
nnoremap <leader>w :normal! :w:!bash ~/dotfiles/scripts/addg.sh<cr>
" multi-cursors like effect :D
nnoremap <leader>rr *``cgn
noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>
nnoremap <leader>yp :call CopyImgPath()<cr>
nnoremap <C-s> <esc>:w<CR>
inoremap <C-s> <esc>:wi
nnoremap <leader>f :FZFNeigh<cr>

" make my life harder so that i would learn
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
