" Vim configuration file
" :so % — reload config file without restarting vim,
" :so $MYVIMRC — another way; :so ~/.vimrc — on unix; :so ~/_vimrc — on
" windows.

set nocompatible              " be iMproved, required
filetype off                  " required

" Vundle VIM-package manager initialization
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

  " Required for Vundle
  Plugin 'VundleVim/Vundle.vim'
  " Plugins
  Plugin 'scrooloose/nerdtree'
  Plugin 'xolox/vim-misc'
  Plugin 'xolox/vim-session'
  Plugin 'bling/vim-airline'

call vundle#end()            " required
filetype plugin indent on    " required
" Vundle initialization section end

" Setting color mode because of Konsole, missbehaving(?) without tha option
if !($TERM == 'linux')
  set t_Co=256
endif
" slate for root, elflord for user
colorscheme elflord

" vim-session settings
let g:session_autosave = 'no'
let g:session_autoload = 'no'

" Enable vim-airline
let g:airline#extensions#tabline#enabled = 1
" theme for visual user separation
" kalisi for root, auto/default-dark for user
"let g:airline_theme = 'dark'

if has('autocmd')
  filetype plugin indent on
endif

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Setting 80-column highlighting line, default is red, setting blue for terminal
set colorcolumn=81
" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
set number

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Statusline : current mode, filename, encoding
set laststatus=2

hi ColorColumn ctermbg=4
" Dealing with encodings once and for all
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8
" Size of a hard tabstop
set tabstop=2
" Size of an "indent"
set shiftwidth=2
" A combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=2
" Make "tab" insert indents instead of tabs at the beginning of a line
set smarttab
" Always uses spaces instead of tab characters
set expandtab
set autoindent
set list          " Display unprintable characters f12 - switches
set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping

" Keyboard mappings
map <C-n> :NERDTreeToggle<CR>

