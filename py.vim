set encoding=utf-8

"设置ycm
"set runtimepath+=~/vim-ycm-20161024/YouCompleteMe

"let g:ycm_global_ycm_extra_conf = '~/vim-ycm-20161024/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_python_binary_path = 'C:/Python27'
let g:ycm_show_diagnostics_ui = 0

"python PEP8 缩进标准
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79	"每行代码长度不超过80
set expandtab
set autoindent
set fileformat=unix

" 不显示gui
if has("gui_running")
    set guioptions-=m "隐藏菜单栏
    set guioptions-=T "隐藏工具栏
endif

"定义BadWhitespace 高亮群组
hi BadWhitespace guifg=gray guibg=red ctermfg=gray ctermbg=red
"多余的空白字符红色显示
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/

"设置<F5>是执行当前py文件
:noremap <F5> :!python %<CR>
:inoremap <F5> <esc>:!python %<CR>

"设置vim的注释	
:inoremap <leader>i <esc>:s/^/\#/<CR>i
:inoremap <leader>u <esc>:s/\#/<CR>i
:vnoremap <leader>i :s/^/\#/<CR>
:vnoremap <leader>u :s/\#/<CR>
:nnoremap <leader>i :s/^/\#/<CR>
:nnoremap <leader>u :s/\#/<CR>

"折叠
set foldmethod=indent
set foldlevel=99

"使用空格键折叠和取消折叠
nnoremap <space> za     
"SimpyFold 插件，看到在折叠代码的文档字符串
let g:SimpyFold_docstring_preview=1

"指定屏幕分割区域 :sv 纵向布局，新文件在当前文件下方打开，:vs
"横向模具，新文件在当前文件右侧打开
set splitbelow
set splitright
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"设置ycm 的python
"完成操作之后，自动补全窗口不消失
let g:ycm_autoclose_preview_window_after_completion=1	
"转到定义快捷方式
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_seed_identifiers_with_syntax=1
"map <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR> 

"virtualenv 虚拟环境的支持 
"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir=os.environ['VIRTUAL_ENV']
	activate_this=os.path.join(project_base_dir,'bin/activate_this.py')
	execfile(activate_this,dict(__file__=activate_this))
EOF

"nerdtree-tabs  插件在python中打开
let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_open_on_gui_startup = 0

"vim-flake8 PEP8风格检查插件 配置
let python_highlight_all=1
syntax on

"python 配色方案设置 需要Zenburn 和 vim-colors-solarized插件
"if has('gui_running')
"	set background=dark
"	colorscheme solarized
"else
"	colorscheme Zenburn
"endif

"----jedi-vim config
let g:jedi#goto_command="gd"
let g:jedi#goto_assignments_command="<c-]>"
let g:jedi#usages_command="cj"
let g:jedi#documentation_command="<c-g>"
let g:jedi#rename_command="gr"

let g:jedi#auto_initialization=1
let g:jedi#use_tabs_not_buffers=1
let g:jedi#popup_on_dot=1
let g:jedi#popup_select_first=0
let g:jedi#completions_enabled=1
let g:jedi#show_call_signatures="0"
"pydiction--
let g:pydiction_location='~/vimfiles/bundle/pydiction/complete-dict'
let g:pydiction_menu_height=30

"--complier command by cyc form learn vimscript the hard way
if !exists("g:py_command")
	let g:py_command='python'
endif
function! PyCompileAndRunFile()
	silent !clear
	execute "!".g:py_command." " . bufname("%")
endfunction

nnoremap <buffer> <localleader>r :call PyCompileAndRunFile()<cr>
nnoremap <buffer> <localleader>b :call PyShowResultInVim()<cr>

function! PyShowResultInVim()
	"get result
	let result=system(g:py_command ." ". bufname("%"))
	echom result

	"open a new split and set it up
    vsplit __Py_Result__
    normal! ggdG
    setlocal filetype=pyresult
    setlocal buftype=nofile

	"Insert the result
    call append(0,split(result,'\v\n'))
endfunction

"auto complete form own file module
python << EOF
import os
import sys
sys.path.append(os.getcwd())
sys.path.append("c:/Python27/")
EOF

