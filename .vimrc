" Vim configuration file

" :so % — reload config file without restarting vim,
" :so $MYVIMRC — another way; :so ~/.vimrc — on unix; :so ~/_vimrc — on
" windows.

" VUNDLE plugin manager section
" Preconfiguration for vundle
set nocompatible              " be iMproved, required by vundle
filetype off                  " required by vundle

" Vundle VIM-package manager initialization

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"""
  " Required for Vundle
  Plugin 'VundleVim/Vundle.vim'

  " Plugins:
  Plugin 'scrooloose/nerdtree'
  Plugin 'ctrlpvim/ctrlp.vim'

  " vim-session begin
  Plugin 'xolox/vim-misc'
  Plugin 'xolox/vim-session'
  " vim-session end

  " airline begin
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  " airline end

  Plugin 'henrik/vim-indexed-search'
  Plugin 'Yggdroot/indentLine'            " indentatin guides
  Plugin 'jlanzarotta/bufexplorer'
  Plugin 'rking/ag.vim'                   " Ag (silver search) integration
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'majutsushi/tagbar'
  Plugin 'vim-syntastic/syntastic'
  Plugin 'tpope/vim-unimpaired'
  Plugin 'tpope/vim-endwise'              " end tags
  Plugin 'cohama/lexima.vim'              " auto close pairs: (), quotes

  " Ruby and Rails support begin
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'tpope/vim-rails'
  " Ruby and Rails support end
"""
call vundle#end()            " required
filetype plugin indent on    " required
" Vundle initialization section end

" PLUGIN settings
filetype plugin on " for nerdcommenter

" vim-session settings
let g:session_persist_colors = 0
let g:session_persist_font = 0
" vim-session settings end

" vim-ruby plugin configuration section
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
" vim-ruby section end

" Turn on evalution of ruby code for completition
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

" Enable vim-airline
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_symbols_ascii = 1
"let g:airline#extensions#syntastic#enabled = 1

" vim-session settings
let g:session_autosave = 'no'
let g:session_autoload = 'no'

" indentLine section
let g:indentLine_char = "┆"
if has('syntax') && exists('g:syntax_on')
  syntax enable
  let g:indentLine_enabled = 1
else
  let g:indentLine_enabled = 0
endif
" indentLine section end

" tagbar settings
let g:tagbar_autofocus = 1
let g:tagbar_left = 1
" tagbar settings end

" Disable system bell (beep)
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" Setting color mode because of Konsole, missbehaving(?) without that option
if !($TERM == 'linux')
  set t_Co=256
  if !(has('clipboard') == 0)
    set mouse=a
  endif
  " slate for root, elflord for user
  if !(has("gui_running"))
    if $USER == 'root'
      colorscheme slate
    else
      colorscheme elflord
    endif
  endif
  " Faster settings for vim running under X
  "screen.xterm-256color
  if $TERM == "xterm-256color" ||
        \ $TERM == "xterm"
    set ttyfast
    set ttymouse=xterm2
  endif
endif

" Unprintable characters section and airline theme
" Unprintable chars mapping
if !( $TERM == "linux" || $TERM == "screen.linux" ||
      \ $TERM == "tmux.linux" )
  " For tty text-only session
  set listchars=eol:↵,tab:\ \ ,trail:•,extends:»,precedes:«
  if !(has("gui_running"))
    let g:airline_theme = 'base16_grayscale'
  endif
else
  " if no tty-mode detected
  if !(has("gui_running"))
    set listchars=eol:¬,tab:\ \ ,trail:•,extends:»,precedes:«
    let g:airline_theme = 'base16_grayscale'
  endif
endif

" Edit crontab in MacOS
" https://stackoverflow.com/questions/15395479/why-ive-got-no-crontab-entry-on-os-x-when-using-vim
autocmd FileType crontab setlocal nowritebackup

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Swap files options:
" Turn swap files off:
set noswapfile

" or create them in dedicated directory:
"set backupdir=~/.vim/backup//
"set directory=~/.vim/swap//
"set undodir=~/.vim/undo//

" Show (partial) command in status line.
"set showcmd
" Show matching brackets.
set showmatch
" Statusline : current mode, filename, encoding
set laststatus=2
" Dealing with encodings once and for all
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8
" Size of a hard tabstop
set tabstop=2
" Size of an indent
set shiftwidth=2

" A combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=2
" Make -tab- insert indents instead of tabs at the beginning of a line
set smarttab
" Always uses spaces instead of tab characters
set expandtab
" Copy indent from current line when starting a new line
set autoindent
" Next two options make searces simplier and visual.
set ignorecase
" Show as much as possible of a wrapped last line, not just "@".
set display=lastline
" Allow to switch between buffers without saving them
set hidden

" Close confirmation for unsaved buffers
"set confirm
" Speedup VIM
" http://eduncan911.com/software/fix-slow-scrolling-in-vim-and-neovim.html
set lazyredraw
" String with options in command mode when pressing Tab
set wildmenu
" Syntax for thor files (like ruby)
au BufRead,BufNewFile *.thor set filetype=ruby

function! ToggleSyntax()
  if exists("g:syntax_on")
    syntax off
    call Set_ccol_col()
  else
    syntax enable
    call Set_ccol_col()
  endif
  redraw
endfunction

" Removes trailing spaces
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

function! FoldLongLinesRu()
  " Implement detection of was text area specified or not
  " Be careful with non-latin character sets
  %!fold -s -b -w 160
endfunction

function! FoldLongLines()
  " Implement detection of was text area specified or not
  " Be careful with non-latin character sets
  "%!fold -s -w 80
  '<,'>!fold -s -w 80
endfunction

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" Run a command in multiple buffers
" source: http://vim.wikia.com/wiki/Run_a_command_in_multiple_buffers
" Like windo but restore the current window.
function! WinDo(command)
  let currwin=winnr()
  execute 'windo ' . a:command
  execute currwin . 'wincmd w'
endfunction
com! -nargs=+ -complete=command Windo call WinDo(<q-args>)

" Like bufdo but restore the current buffer.
function! BufDo(command)
  let currBuff=bufnr("%")
  execute 'bufdo ' . a:command
  execute 'buffer ' . currBuff
endfunction
com! -nargs=+ -complete=command Bufdo call BufDo(<q-args>)

" Like tabdo but restore the current tab.
function! TabDo(command)
  let currTab=tabpagenr()
  execute 'tabdo ' . a:command
  execute 'tabn ' . currTab
endfunction
com! -nargs=+ -complete=command Tabdo call TabDo(<q-args>)

" Unprintable characters show toggle
function! ToggleList()
  if (&list == '0')
    Bufdo execute "let &list = 1"
    Windo execute "let &list = 1"
    Tabdo execute "let &list = 1"
  else
    Bufdo execute "let &list = 0"
    Windo execute "let &list = 0"
    Tabdo execute "let &list = 0"
  endif
endfunction

" Line numbers toggle
function! NumberToggle()
  if (&number == '0')
    Bufdo execute "let &number = 1"
    Windo execute "let &number = 1"
    Tabdo execute "let &number = 1"
  else
    Bufdo execute "let &number = 0"
    Windo execute "let &number = 0"
    Tabdo execute "let &number = 0"
  endif
endfunction

" Toggle text search highlight
function! HLS_toggle()
  if (&hlsearch == '0')
    let &hlsearch = 1
    let &incsearch = 1
  else
    let &hlsearch = 0
    let &incsearch = 0
  endif
endfunction
" Initial search higlight mode
set nohls

" COLOR COLUMN
" 80 columns limit guide
" Setting color column after syntax, because of syntax at startup overrides
" color setting. Dark gray (8) colorcolumn.
function! Set_ccol_col()
  " Set colorcolumn color
  if !( $TERM == "linux" || $TERM == "screen" || $TERM == "tmux" ||
        \ $TERM == "screen.linux" || $TERM == "tmux.linux" )
    hi ColorColumn ctermbg=darkgray
  endif
endfunction
call Set_ccol_col() " initial execution

function! Set_cline()
  " Set cursor line
  " Reference: http://vim.wikia.com/wiki/Highlight_current_line
  hi CursorLine cterm=NONE ctermbg=black ctermfg=NONE guibg=darkred guifg=white
endfunction
call Set_cline() " initial execution

function! ToggleCline()
  " Toggle cursor line
  set cursorline!
endfunction

" Another method: highlighted only symbols in lines, if there is no limit
" exceed no column will shown.
"highlight ColorColumn ctermbg=darkgray
"call matchadd('ColorColumn', '\%81v', 100)
let g:colorcolumn_guide = 81
let g:column_actions = [ "let &colorcolumn = g:colorcolumn_guide",
      \ "let &colorcolumn = 0" ]
function! ColonGuideToggle()
  let s:colorcolumn_state = &colorcolumn
  if (s:colorcolumn_state == '0') || (&colorcolumn == '')
    Bufdo execute g:column_actions[0]
    Windo execute g:column_actions[0]
    Tabdo execute g:column_actions[0]
  elseif s:colorcolumn_state == g:colorcolumn_guide
    Bufdo execute g:column_actions[1]
    Windo execute g:column_actions[1]
    Tabdo execute g:column_actions[1]
  endif
  set colorcolumn
endfunction

function! Remove_bom()
  " Remove byte order marker from UTF-8 file
  :setlocal nobomb
  w
endfunction


" KEYBOARD MAPPINGS

" Plugins key mappings
map <C-n> :NERDTreeToggle<CR>
" User functions key mappings
" GUI-style copy-paste
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" No-break indent paste mode toogle
set pastetoggle=<F2>

" And keyboard remappings for vertical navigation
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap j gj
vnoremap k gk
vnoremap <Down> gj
vnoremap <Up> gk

" Disabled for the sake of better user experience,
" and this is not always needed.
  "inoremap <silent> <Down> <C-o>gj
  "inoremap <silent> <Up> <C-o>gk
" Buffers navigation. <Leader> by default mapped to "\" character.
nmap <Leader>[ :bp<CR>
nmap <Leader>] :bn<CR>

" Toogle syntax highlighting
nmap <silent>;s :call ToggleSyntax()<CR>
" Clear trailing whitespace
nnoremap <silent>;w :call TrimWhiteSpace()<CR>
vnoremap <silent>;f :call FoldLongLines()<CR>
" Search highlight toogle
nnoremap <silent><F3> :call HLS_toggle()<CR>

map <F4> :call ToggleList()<CR>
map <F5> :call NumberToggle()<CR>
map <F6> :call ColonGuideToggle()<CR>

" Indicate current line with different color
map <F7> :call ToggleCline()<CR>

nnoremap <silent><F8> :IndentLinesToggle<CR>
" Tagbar plugin shortcut
nnoremap <silent> <F9> :TagbarToggle<CR>
" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" replace currently selected text with default register
" without yanking it
vnoremap <leader>p "_dP

  " vimrc end
