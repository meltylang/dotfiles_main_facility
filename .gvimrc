" Graphical VIM configuration file

"language to be used for the menus
set langmenu=en_US.UTF8
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"set guifont=Pragmata\ Pro\ Mono:h20
set guifont=Iosevka\ Term\ Slab:h20

colorscheme evening
set guioptions-=L " vertical-split left-hand scrollbar
set guioptions-=r " right-hand scrollbar
set guioptions+=mT " Menu and toolbar
set guioptions-=e " text tabline for buffers
