let mapleader="," 
:nnoremap <leader>ev :e $MYVIMRC<cr>
:nnoremap <leader>sv :so $MYVIMRC<cr>
:nnoremap <leader>, :so %<cr>
:inoremap jj <esc>

set nu

"so ~/.vim/vundle.vim
so ~/.vim/bundle/VimNote/linux_vundle.vim

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

"ycm config
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/VimNote/.ycm_extra_conf.py'
set completeopt=longest,menu
autocmd InsertLeave *if pumvisible()==0 | pclose|endif
nnoremap <leader>jd :YcmCompleter GoToDefinition ElseDeclaration<cr>
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_collect_identifiers_from_comments_and_strings=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_autoclose_preview_window_after_completion=1 
let g:ycm_key_invoke_completion='<S-Space>'
let g:ycm_cache_omnifunc=0
let g:ycm_python_binary_path='/usr/bin/python2.7'
let g:ycm_semantic_triggers={
			\ 'c' : ['->','.'],
			\ 'erlang' : [':'],
			\ 'lua' : ['.',':'],
			\ 'cspc,java,javascript,typescript,d,python,go':['.'],
			\ }

