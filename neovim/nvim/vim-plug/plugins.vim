" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " FZF
    Plug 'vijaymarupudi/nvim-fzf'
    " Spellchecking
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'lewis6991/spellsitter.nvim'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-dadbod'
    Plug 'kristijanhusak/vim-dadbod-ui'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ellisonleao/glow.nvim'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
    Plug 'leafOfTree/vim-svelte-plugin'
    " Theme
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()
