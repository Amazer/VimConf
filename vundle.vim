"set vundle----
if has("win32")
    set runtimepath+=~/vimfiles/bundle/Vundle.vim/
    call vundle#rc('~/vimfiles/bundle/')
else
    set runtimepath+=~/.vim/bundle/Vundle.vim/
    call vundle#rc('~/.vim/bundle/')
endif
"YouComplete
Plugin 'Valloric/YouCompleteMe'

Plugin 'gmarik/vundle'
"python �����
Plugin 'tmhedberg/SimpylFold'    "�۵����
Plugin 'kien/ctrlp.vim'         "c-p �����ļ����
Plugin 'scrooloose/nerdtree'    "�ļ�������
Plugin 'jistr/vim-nerdtree-tabs'    "�ļ������� ʹ��tab��
"Plugin 'scrooloose/syntastic' "����﷨�������
Plugin 'vim-scripts/indentpython.vim'   "python �Զ��������
Plugin 'nvie/vim-flake8'        "PEP8 ��������
Plugin 'rkulla/pydiction'
Plugin 'majutsushi/tagbar'
Plugin 'gregsexton/MatchTag'
Plugin 'Lokaltog/vim-powerline'
Plugin 'heavenshell/vim-pydocstring'
"Plugin 'ybian/smartim'

"��ɫ����
Plugin 'jnurmine/Zenburn'       "��ɫ���� �ն�ģʽ
Plugin 'altercation/vim-colors-solarized' "��ɫ���� GUIģʽ
Plugin 'Lokaltog/vim-distinguished' "distinguished ��ɫ����
Plugin 'nanotech/jellybeans.vim' "jellybeans ��ɫ����
Plugin 'ryanb/dotfiles' "dotfiles ��ɫ����


"Plugin 'tpope/vim-fugitive' "vim��ִ��Git���� 
Plugin 'Amazer/vim-fugitive' "vim��ִ��Git���� 
Plugin 'tpope/vim-git' "git �������

"cs���
"Plugin 'OmniSharp/omnisharp-vim' "Ominisharp-vim
Plugin 'tpope/vim-dispatch' "�첽ִ�� c#
Plugin 'vim-syntastic/syntastic' 
"ultisnips 
Plugin 'SirVer/ultisnips' "Track the engine
Plugin 'honza/vim-snippets' "

"Omnisharp plugins
Plugin 'OrangeT/vim-csharp' "
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
 
"auto complete
Plugin 'shougo/neocomplete.vim'
"Plugin 'shougo/neocomplcache.vim'
"Plugin 'Shougo/neocomplcache'
"Plugin 'Shougo/neocomplete'
"Plugin 'Shougo/neosnippet'
"Plugin 'Shougo/neosnippet-snippets'


"cyc plugin test note.vim
Plugin 'Amazer/NoteVim'
Plugin 'Amazer/VimConf'
"erlang
Plugin 'vim-erlang/vim-erlang-omnicomplete'
Plugin 'vim-erlang/vim-erlang-runtime'
"Plugin 'vim-erlang/vim-erlang-compiler'
"Plugin 'jimenezrick/vimerl'


"ack.vim ���������ļ�
"Plugin 'mileszs/ack.vim'
"let g:ackprg='ag --nogroup --nocolor --column'

Plugin 'davidhalter/jedi-vim'

" evervim
Plugin 'kakkyz81/evervim'

Plugin 'thinca/vim-ref'
call vundle#end()
"set vundle end
