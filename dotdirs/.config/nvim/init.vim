colorscheme atom-dark

" Indentation settings
set tabstop=4
set shiftwidth=2
set expandtab
set smarttab

" Other settings
syntax enable
set termguicolors
set number
set nofoldenable
set updatetime=100
set mouse=a

filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')
    Plugin 'VundleVim/Vundle.vim'

    " Plugins
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'Shougo/deoplete.nvim'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'nathanaelkane/vim-indent-guides'
    Plugin 'https://gitlab.com/code-stats/code-stats-vim'

    " Syntax files
    Plugin 'sheerun/vim-polyglot'
call vundle#end()
filetype plugin indent on

" Plugin settings
let g:airline#extensions#tabline#enabled = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:deoplete#enable_at_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1

" Load Code::Stats API key
source ~/.config/nvim/codestats.key.vim
