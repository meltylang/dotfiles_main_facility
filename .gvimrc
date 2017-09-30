" Graphical VIM configuration file

"language to be used for the menus
set langmenu=en.UTF8
let $LANG = 'en'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"set guifont=DejaVu\ Sans\ Mono\ 12
"set guifont=Pragmata\ Pro\ Mono\ Regular\ 14
set guifont=Iosevka\ Term\ 14
win 120 40

colorscheme evening
set guioptions-=L " vertical-split left-hand scrollbar
set guioptions-=r " right-hand scrollbar
set guioptions+=mT " Menu and toolbar
set guioptions-=e " text tabline for buffers
