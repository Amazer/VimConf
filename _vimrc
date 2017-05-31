if has("win32")
    "设置窗口位置最大化
    "启动时候，全屏
    :au GUIEnter * simalt ~x
    "关闭闪屏提示
    au GuiEnter * set t_vb=
    "设置 不显示菜单栏和工具栏
    :set guioptions-=m
    :set guioptions-=T
    "解决菜单乱码
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
endif


"关闭提示音
set vb t_vb=
"VimConf  global settings
if has("win32")
    let g:vimconf_vundle_conf='~/vimfiles/bundle/VimConf/vundle.vim'
    let g:vimconf_path='~/vimfiles/bundle/VimConf'
else
    let g:vimconf_vundle_conf='~/.vim/bundle/VimConf/vundle.vim'
    let g:vimconf_path='~/.vim/bundle/VimConf'
endif

let mapleader="," "设置普通模式快捷键为jj
:inoremap jj <esc>

:nnoremap <leader>ev :execute 'e '.g:vimconf_path.'/_vimrc'<cr> 
:nnoremap <leader>sv :execute 'so '.g:vimconf_path.'/_vimrc'<cr> 
:nnoremap <leader>, :execute 'so %'<cr> 


command! CloseBuffer call s:CloseOtherBuffer()
" add open file shortcut
command! CYC call s:OpenFile('~/CYC/')
command! ShaderlabCompleter call s:OpenFile('~/vimfiles/bundle/YouCompleteMe/third_party/ycmd/ycmd/completers/shaderlab/shaderlab_completer.py')
command! Shaderlab call s:OpenFile('~/vimfiles/bundle/vim-shaderlab/autoload/shaderlabcomplete.vim')
command! JediHttp call s:OpenFile('~/vimfiles/bundle/YouCompleteMe/third_party/ycmd/third_party/JediHTTP/jedihttp.py')
command! PythonTest call s:OpenFile('~/pythonWP/__init__.py')
command! GitPush execute 'Gpush origin master'

function! s:OpenFile(fileFullStr)
    execute 'e '.a:fileFullStr
endfunction

function! s:CloseOtherBuffer()
"     let s:curWinNr=winnr()
"     if winbufnr(s:curWinNr)==1
"         return
"     endif

    let s:curBufNr=bufnr('%')
    execute 'bn'
    let s:nextBufNr=bufnr('%')
    while s:nextBufNr != s:curBufNr
        exe 'bn'
        exe 'bdel '.s:nextBufNr
        let s:nextBufNr=bufnr('%')
    endwhile
endfunction

"minibufexpl config
"在minibufexpl中的时候，
"<Tab> 循环向前切换到每个buffer名上
"<S-Tab> 循环向后切换
"<Enter> 打开光标所在的buffer
" d 删除光标所在的buffer
" let g:miniBufExplMapWindowNavVim = 1 
" let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 

"split navigations
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

"使用vundle的配置 
"使用 execute 执行命令
execute 'so '.g:vimconf_vundle_conf
filetype plugin indent on

"nerdtree-tabs  插件不打开
let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_open_on_gui_startup = 0

"可视模式中，使用 * 和 # 查找
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

"展开当前目录
cnoremap <expr> %% getcmdtype( )==':'? expand('%:h').'/':'%%'

"设置文件编码格式
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
set fileencoding=utf-8
set termencoding=utf-8

"if has("win32")
"    set fileencoding=chinese
"else
"    set fileencoding=utf-8
"endif

"解决consle输出乱码
language messages zh_CN.utf-8

set nocompatible
"设置文件类型检测
filetype plugin on
filetype on
filetype indent on 	"为特定文件载入相关缩进文件
syntax enable
syntax on

set fileformat=unix

"设置主题颜色
" colorscheme solarized
"colorscheme Zenburn
" colorscheme candy
"colorscheme Jellybeans
colorscheme desert
"设置退格键
set backspace=indent,eol,start


set incsearch   "搜索
set nu          "显示行号
set ignorecase  "忽略大小写
set guifont=Consolas:h10   "修改字体 

set autoread "文件修改后自动载入
set nobackup "覆盖文件时不备份
set noswapfile "关闭交互文件
set noundofile "关闭.un~文件

set ai "自动缩进
set sw=4 "自动缩进宽度
set ts=4 " tabstop 制表符宽度
set sta  "开启smarttab 在插入模式
set expandtab

set clipboard=unnamed
if has("win32")
    "设置系统剪贴板
    :nnoremap y "+y
    :vnoremap y "+y
    :nnoremap p "+p
    :vnoremap p "+p
    :nnoremap x "+x
    :vnoremap x "+x
    :nnoremap d "+d
    :vnoremap d "+d
endif

"设置(),[],{},""成对出现
":inoremap ( ()<left>
":inoremap [ []<left>
":inoremap { {}<left>
":inoremap " ""<left>
":nnoremap <f5> :!ctags _R<CR>
"
"设置fold
:nnoremap <space> za

"设置tags
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
			\ 'shaderlab,cs,java,javascript,typescript,d,python,go,vim':['.'],
			\ }


"taglist setting
"不同时显示多个文件的tag,只显示当前文件的
let Tlist_Show_One_File=1
"如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_Only_Window=1
"将taglist和ctags关联
let Tlist_Ctags_Cmd="ctags.exe"
"let Tlist_Auto_Open=1

aug configPc
"先清除一下所有命令
:autocmd!

"split navigations
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
"fileformat = unix 
au BufNewFile,BufRead *.* :set fileformat=unix
""保存文件时，自动更新ctags
":autocmd BufWritePost * call system("ctags -R")
"
""文件打开时，光标恢复到上次的位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
"
""如果文件是python，使用python的设置
"au FileType python so ~/vimfiles/py.vim
au FileType python execute 'so '.g:vimconf_path.'/py.vim' 
"
""如果文件是note,使用note的设置（自定义的note类型）
"au BufNewFile,BufRead *.note so ~/vimfiles/note.vim
au BufNewFile,BufRead *.note  execute 'so '.g:vimconf_path.'/note.vim'
"
""如果文件是cs，使用cs的设置
"au FileType cs so ~/vimfiles/cs.vim
au FileType cs execute 'so '.g:vimconf_path.'/cs.vim'

"au FileType cs so ~/vimfiles/csharp.vim
"
"如果文件是.vim，使用vim的设置
au FileType vim execute 'so '.g:vimconf_path.'/vim.vim'
"如果是erlang
"au FileType erlang so ~/vimfiles/erlang.vim
au FileType erlang execute 'so '.g:vimconf_path.'/erlang.vim'

au FileType java let g:EclimCompletionMethond='omnifunc'

au FileType java execute 'so '.g:vimconf_path.'/java.vim'

aug End
