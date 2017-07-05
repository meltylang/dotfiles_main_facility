" Graphical VIM configuration file

"language to be used for the menus
set langmenu=en_US.UTF8
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"set guifont=DejaVu\ Sans\ Mono\ 12
set guifont=Pragmata\ Pro\ Mono\ Regular\ 13
win 120 40

colors evening
set guioptions-=L " vertical-split left-hand scrollbar
set guioptions-=r " right-hand scrollbar
set guioptions+=mT " Menu and toolbar
set guioptions-=e " text tabline for buffers
