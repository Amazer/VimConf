let mapleader="," 
:nnoremap <leader>ev :e $MYVIMRC<cr>
:nnoremap <leader>sv :so $MYVIMRC<cr>
:nnoremap <leader>, :so %<cr>
:inoremap jj <esc>

set nu

so ~/.vim/vundle.vim

filetype plugin indent on
filetype on
filetype plugin on
syntax enable
syntax on

set incsearch
set ignorecase

set nobackup
set noswapfile
set noundofile

set ai
set sw=4
set ts=4
set sta

set backspace=indent,eol,start

set completeopt=longest,menu
autocmd InsertLeave *if pumvisible()==0 | pclose|endif
nnoremap <leader>jd :YcmCompleter GoToDefinition ElseDeclaration<cr>
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_collect_identifiers_from_comments_and_strings=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments=1

