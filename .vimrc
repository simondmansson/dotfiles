set nocompatible    "be iMproved, required
filetype off        "required

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
"General
Plug 'tpope/vim-fugitive'
Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'

"ReasonML
Plug 'reasonml-editor/vim-reason-plus'

"PHP
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
"Javascript
Plug 'prettier/vim-prettier'

call plug#end()            " required

"Open nerd tree when starting vim.
"autocmd vimenter * NERDTree

set number
syntax enable

"tab-completion 
set path+=**
"see :h vundle for more details or wiki for FAQ
set wildmenu

"tab length 
set tabstop=2    
set shiftwidth=2
set softtabstop=2
set expandtab  

"spelling
:set spell spelllang=en_us 
hi clear SpellBad
hi SpellBad cterm=underline

"white space highlighting with colors for dark backgrounds
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ["standard"]
