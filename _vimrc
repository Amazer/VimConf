:au GUIEnter * simalt ~x
"����mapleader
:let mapleader=","
:nnoremap <leader>ev :e $MYVIMRC<cr>
:nnoremap <leader>sv :so $MYVIMRC<cr>

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

so ~/vimfiles/_vimrc_pc
