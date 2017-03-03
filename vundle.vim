"set vundle----
set runtimepath+=~/vimfiles/bundle/Vundle.vim/
call vundle#rc('~/vimfiles/bundle/')
Plugin 'gmarik/vundle'
"python 插件：
Plugin 'tmhedberg/SimpyFold'    "折叠插件
Plugin 'kien/ctrlp.vim'         "c-p 搜索文件插件
Plugin 'scrooloose/nerdtree'    "文件浏览插件
Plugin 'jistr/vim-nerdtree-tabs'    "文件浏览插件 使用tab键
Plugin 'scrooloose/syntastic' "检测语法高亮插件
Plugin 'vim-scripts/indentpython.vim'   "python 自动缩进插件
Plugin 'nvie/vim-flake8'        "PEP8 代码风格检查

"配色方案
Plugin 'jnurmine/Zenburn'       "配色方案 终端模式
Plugin 'altercation/vim-colors-solarized' "配色方案 GUI模式
Plugin 'Lokaltog/vim-distinguished' "distinguished 配色方案
Plugin 'nanotech/jellybeans.vim' "jellybeans 配色方案
Plugin 'ryanb/dotfiles' "dotfiles 配色方案


Plugin 'tpope/vim-fugitive' "vim中执行Git命令 
Plugin 'tpope/vim-git' "git 命令高亮

"cs插件
Plugin 'OmniSharp/omnisharp-vim' "Ominisharp-vim
Plugin 'tpope/vim-dispatch' "异步执行 c#
"ultisnips 
Plugin 'SirVer/ultisnips' "Track the engine
Plugin 'honza/vim-snippets' "

"Omnisharp plugins
Plugin 'OrangeT/vim-csharp' "
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'


"ack.vim 快速搜索文件
"Plugin 'mileszs/ack.vim'
"let g:ackprg='ag --nogroup --nocolor --column'

"Bundle 'davidhalter/jedi-vim'
call vundle#end()
"set vundle end
