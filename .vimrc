set nocompatible    "be iMproved, required
filetype off        "required

"set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"
""let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Keep Plugin commands between vundle#begin/end.
""plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'reasonml-editor/vim-reason-plus'
Plugin 'prettier/vim-prettier'
Plugin 'vim-syntastic/syntastic'
"All of your Plugins must be added before the following line
"call vundle#end()            " required
""filetype plugin indent on    " required
"To ignore plugin indent changes, instead use:
"filetype plugin on
"
""Brief help
":PluginList       - lists configured plugins
"":PluginInstall    - installs plugins; append `!` to update or just
":PluginUpdate
"":PluginSearch foo - searches for foo; append `!` to refresh local cache
":PluginClean      - confirms removal of unused plugins; append `!` to
""auto-approve removal

"see :h vundle for more details or wiki for FAQ
""Put your non-Plugin stuff after this line

set number
colorscheme industry
syntax enable

"tab-completion 
"set path+=**
"set wildmenu
"
""tab length 
set tabstop=2    
set shiftwidth=2
set softtabstop=2
set expandtab  

"spelling
":set spell spelllang=en_us 
"hi clear SpellBad
"hi SpellBad cterm=underline
"
""white space highlighting with colors for dark backgrounds
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

"absolute width of netrw window
"let g:netrw_winsize = -28
"
""tree-view
let g:netrw_liststyle = 3

"sort is affecting only: directories on the top, files below
"let g:netrw_sort_sequence = '[\/]$,*'
"
""open file in a new tab
let g:netrw_browse_split = 3

