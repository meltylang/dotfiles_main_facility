" Graphical VIM configuration file

"language to be used for the menus
set langmenu=en_US.UTF8
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"set guifont=Pragmata\ Pro\ Mono:h20
set guifont=Iosevka\ Term\ Slab:h17

if has("gui_running")
  colorscheme evening
  let g:airline_theme = 'term'
endif

set guioptions-=L " vertical-split left-hand scrollbar
set guioptions-=r " right-hand scrollbar
set guioptions-=T " toolbar
"set guioptions+=mT " Menu and toolbar
set guioptions+=m " Menu and toolbar
set guioptions-=e " text tabline for buffers
