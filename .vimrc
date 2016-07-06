" Vim configuration file
" :so % — reload config file without restarting vim,
" :so $MYVIMRC — another way; :so ~/.vimrc — on unix; :so ~/_vimrc — on
" windows.

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

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
  Plugin 'vim-airline/vim-airline'        " airline plugin
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'rhysd/vim-crystal'
  Plugin 'Yggdroot/indentLine'            " indentatin guides
  Plugin 'rking/ag.vim'                   " Ag (silver search) integration

call vundle#end()            " required
filetype plugin indent on    " required
" Vundle initialization section end

" Setting color mode because of Konsole, missbehaving(?) without tha option
if !($TERM == 'linux')
  set t_Co=256
  if !(has('clipboard') == 0)
    set mouse=a
  endif
  " slate for root, elflord for user
  if $USER == 'root'
    colorscheme slate
  else
    colorscheme elflord
  endif
endif

" Enable vim-airline
let g:airline#extensions#tabline#enabled = 1
" theme for visual user separation
" kalisi for root, auto/default-dark for user
let g:airline_theme = 'dark'

" vim-session settings
let g:session_autosave = 'no'
let g:session_autoload = 'no'

if has('autocmd')
  filetype plugin indent on
endif

if has('syntax') && !exists('g:syntax_on')
  syntax enable
  let g:indentLine_enabled = 1
else
  let g:indentLine_enabled = 0
endif

" 80 columns limit guide
" Setting color column after syntax, because of syntax at startup overrides
" color setting. Dark gray colorcolumn.
hi ColorColumn ctermbg=8
" Setting 81-column highlighting line.
"set colorcolumn=81
" Another method: highlighted only symbols in lines, if there is no limit
" exceed no column will shown.
"highlight ColorColumn ctermbg=darkgray
"call matchadd('ColorColumn', '\%81v', 100)

" Line numbers
"set number
" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
" Statusline : current mode, filename, encoding
set laststatus=2
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
set expandtab  " Always uses spaces instead of tab characters
set autoindent " Copy indent from current line when starting a new line
" Next two options make searces simplier and visual.
set ignorecase
" set hlsearch
" Show as much as possible of a wrapped last line, not just "@".
set display=lastline
" Allow to switch between buffers without sawing them
set hidden
" Close confirmation for unsaved buffers
set confirm
" Unprintable chars mapping
if !($TERM == 'linux')
  set listchars=eol:↵,tab:•\ ,trail:•,extends:»,precedes:«
else
  set listchars=eol:$,tab:•\ ,trail:•,extends:»,precedes:«
endif
" Display unprintable characters f12 - switches
set list

" And keyboard remappings for vertical navigation
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap k gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
" Buffers navigation. <Leader> by default mapped to "\" character.
nmap <Leader>[ :bp<CR>
nmap <Leader>] :bn<CR>

" Keyboard mappings
map <C-n> :NERDTreeToggle<CR>

