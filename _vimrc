if has("win32")
    "���ô���λ�����
    "����ʱ��ȫ��
    :au GUIEnter * simalt ~x
    "�ر�������ʾ
    au GuiEnter * set t_vb=
    "���� ����ʾ�˵����͹�����
    :set guioptions-=m
    :set guioptions-=T
    "����˵�����
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
endif

"�ر���ʾ��
set vb t_vb=
"VimConf  global settings
if has("win32")
    let g:vimconf_vundle_conf='~/vimfiles/bundle/VimConf/vundle.vim'
    let g:vimconf_path='~/vimfiles/bundle/VimConf'
else
    let g:vimconf_vundle_conf='~/.vim/bundle/VimConf/vundle.vim'
    let g:vimconf_path='~/.vim/bundle/VimConf'
endif

let mapleader=","
"������ͨģʽ��ݼ�Ϊjj
:inoremap jj <esc>

:nnoremap <leader>ev :execute 'e '.g:vimconf_path.'/_vimrc'<cr> 
:nnoremap <leader>sv :execute 'so '.g:vimconf_path.'/_vimrc'<cr> 

"ʹ��vundle������ 
"ʹ�� execute ִ������
execute 'so '.g:vimconf_vundle_conf
filetype plugin indent on

"nerdtree-tabs  �������
let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_open_on_gui_startup = 0

"����ģʽ�У�ʹ�� * �� # ����
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
	let temp=@s
	norm! gv"sy
	let @/ = '\V' . substitute(escape(@s,'/\'),'\n','\\n','g')
	let @s = temp
endfunction

function! OpenFileLocation()
if(expand("%")!="")
		execute "!start explorer /select,%"
	else
		execute "!start explorer /select,%:p:h"
	endif
endfunction

:nnoremap cm :call OpenFileLocation()<CR>

"չ����ǰĿ¼
cnoremap <expr> %% getcmdtype( )==':'? expand('%:h').'/':'%%'

"�����ļ������ʽ
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1

if has("win32")
    set fileencoding=chinese
else
    set fileencoding=utf-8
endif

"���consle�������
language messages zh_CN.utf-8

set nocompatible
"�����ļ����ͼ��
filetype plugin on
filetype on
filetype indent on 	"Ϊ�ض��ļ�������������ļ�
syntax enable
syntax on

set fileformat=unix

"����������ɫ
"colorscheme solarized
"colorscheme Zenburn
"colorscheme candy
"colorscheme Jellybeans
colorscheme desert
"�����˸��
set backspace=indent,eol,start


set incsearch   "����
set nu          "��ʾ�к�
set ignorecase  "���Դ�Сд
set guifont=Consolas:h10   "�޸����� 

set autoread "�ļ��޸ĺ��Զ�����
set nobackup "�����ļ�ʱ������
set noswapfile "�رս����ļ�
set noundofile "�ر�.un~�ļ�

set ai "�Զ�����
set sw=4 "�Զ��������
set ts=4 " tabstop �Ʊ�����
set sta  "����smarttab �ڲ���ģʽ
set expandtab


"����ϵͳ������
:nnoremap y "+y
:vnoremap y "+y
:nnoremap p "+p
:vnoremap p "+p
:nnoremap x "+x
:vnoremap x "+x
:nnoremap d "+d
:vnoremap d "+d

"����(),[],{},""�ɶԳ���
":inoremap ( ()<left>
":inoremap [ []<left>
":inoremap { {}<left>
":inoremap " ""<left>
":nnoremap <f5> :!ctags _R<CR>
"
"����fold
:nnoremap <space> za

"����tags
set tags=tags
set autochdir

" ycm my vimConf settings
"let g:ycm_global_ycm_extra_conf='~/vimfiles/bundle/VimConf/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf='~/VimPlugins/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_collect_identifiers_from_comments_and_strings=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_autoclose_preview_window_after_completion=1 
let g:ycm_key_invoke_completion='<c-x>'
let g:ycm_cache_omnifunc=0

"let g:ycm_python_binary_path='c:/Python27/'
"let g:ycm_python_binary_path='/usr/bin/python2.7'
"let g:ycm_python_binary_path='~/../../Python27'
"let g:ycm_server_python_interpreter='/usr/bin/python2.7'
"let g:ycm_server_python_interpreter='c:/Python27/python.exe'

set completeopt=longest,menu
autocmd InsertLeave *if pumvisible()==0 | pclose|endif

let g:ycm_semantic_triggers={
			\ 'c' : ['->','.'],
			\ 'erlang' : [':'],
			\ 'lua' : ['.',':'],
			\ 'cs,java,javascript,typescript,d,python,go,vim':['.'],
			\ }


"taglist setting
"��ͬʱ��ʾ����ļ���tag,ֻ��ʾ��ǰ�ļ���
let Tlist_Show_One_File=1
"���taglist���������һ�����ڣ����˳�vim
let Tlist_Exit_Only_Window=1
"��taglist��ctags����
let Tlist_Ctags_Cmd="ctags.exe"
"let Tlist_Auto_Open=1

aug configPc
"�����һ����������
:autocmd!
"
""�����ļ�ʱ���Զ�����ctags
":autocmd BufWritePost * call system("ctags -R")
"
""�ļ���ʱ�����ָ����ϴε�λ��
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
"
""����ļ���python��ʹ��python������
"au FileType python so ~/vimfiles/py.vim
au FileType python execute 'so '.g:vimconf_path.'/py.vim' 
"
""����ļ���note,ʹ��note�����ã��Զ����note���ͣ�
"au BufNewFile,BufRead *.note so ~/vimfiles/note.vim
au BufNewFile,BufRead *.note  execute 'so '.g:vimconf_path.'/note.vim'
"
""����ļ���cs��ʹ��cs������
"au FileType cs so ~/vimfiles/cs.vim
au FileType cs execute 'so '.g:vimconf_path.'/cs.vim'

"au FileType cs so ~/vimfiles/csharp.vim
"
"����ļ���.vim��ʹ��vim������
au FileType vim execute 'so '.g:vimconf_path.'/vim.vim'
"�����erlang
"au FileType erlang so ~/vimfiles/erlang.vim
au FileType erlang execute 'so '.g:vimconf_path.'/erlang.vim'

aug End
