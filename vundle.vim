"set vundle----
set runtimepath+=~/vimfiles/bundle/Vundle.vim/
call vundle#rc('~/vimfiles/bundle/')
Plugin 'gmarik/vundle'
"python �����
Plugin 'tmhedberg/SimpyFold'    "�۵����
Plugin 'kien/ctrlp.vim'         "c-p �����ļ����
Plugin 'scrooloose/nerdtree'    "�ļ�������
Plugin 'jistr/vim-nerdtree-tabs'    "�ļ������� ʹ��tab��
Plugin 'scrooloose/syntastic' "����﷨�������
Plugin 'vim-scripts/indentpython.vim'   "python �Զ��������
Plugin 'nvie/vim-flake8'        "PEP8 ��������

"��ɫ����
Plugin 'jnurmine/Zenburn'       "��ɫ���� �ն�ģʽ
Plugin 'altercation/vim-colors-solarized' "��ɫ���� GUIģʽ
Plugin 'Lokaltog/vim-distinguished' "distinguished ��ɫ����
Plugin 'nanotech/jellybeans.vim' "jellybeans ��ɫ����
Plugin 'ryanb/dotfiles' "dotfiles ��ɫ����


Plugin 'tpope/vim-fugitive' "vim��ִ��Git���� 
Plugin 'tpope/vim-git' "git �������

"cs���
Plugin 'OmniSharp/omnisharp-vim' "Ominisharp-vim
Plugin 'tpope/vim-dispatch' "�첽ִ�� c#
"ultisnips 
Plugin 'SirVer/ultisnips' "Track the engine
Plugin 'honza/vim-snippets' "

"Omnisharp plugins
Plugin 'OrangeT/vim-csharp' "
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'


"ack.vim ���������ļ�
"Plugin 'mileszs/ack.vim'
"let g:ackprg='ag --nogroup --nocolor --column'

"Bundle 'davidhalter/jedi-vim'
call vundle#end()
"set vundle end
