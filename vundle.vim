"set vundle----
if has("win32")
    set runtimepath+=~/vimfiles/bundle/vundle/
    call vundle#rc('~/vimfiles/bundle/')
else
    set fileencoding=utf-8
    set runtimepath+=~/.vim/bundle/vundle/
    call vundle#rc('~/.vim/bundle/')
endif
"YouComplete
Plugin 'Valloric/YouCompleteMe'

Plugin 'gmarik/vundle'
"python 插件：
"折叠插件
Plugin 'tmhedberg/SimpylFold'    
"c-p 搜索文件插件
Plugin 'kien/ctrlp.vim'         
"文件浏览插件
Plugin 'scrooloose/nerdtree'    
"文件浏览插件 使用tab键
Plugin 'jistr/vim-nerdtree-tabs'    
"检测语法高亮插件
"Plugin 'scrooloose/syntastic' 
"python 自动缩进插件
Plugin 'vim-scripts/indentpython.vim'   
"PEP8 代码风格检查
Plugin 'nvie/vim-flake8'        
Plugin 'rkulla/pydiction'
" Plugin 'majutsushi/tagbar'
" Plugin 'gregsexton/MatchTag'
" Plugin 'Lokaltog/vim-powerline'
" Plugin 'heavenshell/vim-pydocstring'
"Plugin 'ybian/smartim'

"配色方案
"配色方案 终端模式
Plugin 'jnurmine/Zenburn'       
"配色方案 GUI模式
Plugin 'altercation/vim-colors-solarized' 
"distinguished 配色方案
Plugin 'Lokaltog/vim-distinguished' 
"jellybeans 配色方案
Plugin 'nanotech/jellybeans.vim' 
"dotfiles 配色方案
" Plugin 'ryanb/dotfiles' 


"vim中执行Git命令 
"Plugin 'tpope/vim-fugitive' 
""vim中执行Git命令 
Plugin 'Amazer/vim-fugitive' 
"git 命令高亮
Plugin 'tpope/vim-git' 

"cs插件
""Ominisharp-vim
"Plugin 'OmniSharp/omnisharp-vim' 
""异步执行 c#
Plugin 'tpope/vim-dispatch' 
Plugin 'vim-syntastic/syntastic' 
"ultisnips 
""Track the engine
Plugin 'SirVer/ultisnips' 
Plugin 'honza/vim-snippets' "

"Omnisharp plugins
Plugin 'OrangeT/vim-csharp' "
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
 
"auto complete
" Plugin 'shougo/neocomplete.vim'
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


"ack.vim 快速搜索文件
"Plugin 'mileszs/ack.vim'
"let g:ackprg='ag --nogroup --nocolor --column'

Plugin 'davidhalter/jedi-vim'

" evervim
Plugin 'kakkyz81/evervim'

Plugin 'thinca/vim-ref'

"extension for fugitive.vim Gbrower
Plugin 'tpope/vim-rhubarb'
Plugin 'Amazer/vim-shaderlab'

Plugin 'vim-scripts/android.vim'
" Plugin 'VictorDenisov/javacomplete'
Plugin 'artur-shaik/vim-javacomplete2'
" Plugin 'Amazer/minibufexplorerpp'
call vundle#end()
"set vundle end
