set encoding=utf-8
let g:ycm_python_binary_path='/usr/lib/python2.7'
let g:ycm_show_diagnostics_ui=0

"python PEP8 缩进标准
set tabstop=4
set softtabstop=4
set shiftwidth=4
"每行代码长度不超过80
set textwidth=79
set expandtab
set autoindent
set fileformat=unix

"定义BadWhitespace 高亮群组
highlight BadWhitespace guifg=gray guibg=red ctermfg=gray ctermbg=red
"多余的空白字符红色显示
autocmd BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/

"设置F5执行当前py文件
:noremap <F5> :!python %<cr>
:inoremap <F5> <esc>:!python %<cr>

"设置python的注释
:inoremap <leader>i <esc>:s/^/\#/<cr>i
:inoremap <leader>u <esc>:s/\#/<cr>i
:vnoremap <leader>i :s/^/\#/<cr>
:vnoremap <leader>u :s/\#/<cr>
:nnoremap <leader>i :s/^/\#/<cr>
:nnoremap <leader>u :s/\#/<cr>

"折叠
set foldmethod=indent
set foldlevel=99
 "使用空格键折叠和取消折叠
:nnoremap <space> za

"SimpyFold插件，看到在折叠代码的文档字符串
let g:SimpyFold_docstring_preview=1

set splitbelow
set splitright

"切换窗口快捷键
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

"vim-flake8 PEP8风格检查插件配置
let python_highlight_all=1
syntax on

"jedi-vim config
let g:jedi#auto_initialization=1
let g:jedi#use_tabs_not_buffers=1
let g:jedi#popup_on_dot=1
let g:jedi#popup_select_first=0
let g:jedi#completions_enable=1

"--complier command by cyc from learn vimscript the hard way
if !exists("g:py_command")
	let g:py_command='python'
endif

nnoremap <buffer> <localleader>r :call PyCompileAndRunFile()<cr>
nnoremap <buffer> <localleader>b :call PyShowResultInVim()<cr>

function! PyCompileAndRunFile()
	silent !clear
	execute "!".g:py_command." " . bufname("%")
endfunction

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

