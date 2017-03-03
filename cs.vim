"设置ycm
"set runtimepath+=~/vim-ycm-20161024/YouCompleteMe


function! OpenFileLocation()
if(expand("%")!="")
		execute "!start explorer /select,%"
	else
		execute "!start explorer /select,%:p:h"
	endif
endfunction

:nnoremap cm :call OpenFileLocation()<CR>

"设置注释//
:vnoremap ci :s/^/\/\/<CR>
:vnoremap cu :s/\/\//<CR>
:nnoremap ci :s/^/\/\/<CR>
:nnoremap cu :s/\/\//<CR>

"停用ycm，因为和Omnisharp冲突
"let g:ycm_auto_trigger=0

"---2017.3.1
filetype plugin on
let g:OmniSharp_host="http://localhost:2000"
let g:OmniSharp_timeout=1
set noshowmatch
set completeopt=longest,menuone,preview
set splitbelow
"--end

"设置忽略文件类型
let NERDTreeIgnore=['\.meta$','\.lua$','\.pb$']
let g:ctrlptom_ignore='!\.cs$'
let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows

"set wildignore+=*\\tmp\\*,*\\*svn*\\*,*.swp,*.zip,*.exe,*.meta,*.unity,*.assets,*.txt,*.dll " Windows

"设置语法高亮
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0



let g:syntastic_cs_checkers=['syntax','semantic','issuses']

let g:OmniSharp_selector_ui='ctrlp'
let g:omnicomplete_fetch_documentation=1
let g:OmniSharp_want_snippet=1
"let g:OmniSharp_server_type = 'roslyn'
let g:OmniSharp_server_type = 'v1'

"Omnisharp server setting
let g:Omnisharp_start_server=0
let g:Omnisharp_stop_server=0

"augroup omnisharp_commands
augroup omnisharp_commands
    autocmd!


    "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete


    " Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>


    " Builds can also run asynchronously with vim-dispatch installed
    autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
    " automatic syntax check on events (TextChanged requires Vim 7.4)
    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck


    " Automatically add new cs files to the nearest project on save
    "autocmd BufWritePost *.cs call OmniSharp#AddToProject()


    "show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()


    "The following commands are contextual, based on the current cursor position.


    autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap cf :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap cs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap cj :OmniSharpFindUsages<cr>
    autocmd FileType cs nnoremap lm :OmniSharpFindMembers<cr> "finds members in the current buffer
    " cursor can be anywhere on the line containing an issue 
    autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>  
    autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr> "navigate up by method/property/field
    autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr> "navigate down by method/property/field


augroup END

set updatetime=500
" Remove 'Press Enter to continue' message when type information is longer than one line.
set cmdheight=2

" Contextual code actions (requires CtrlP or unite.vim)
nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
" Run code actions with text selected in visual mode to extract method
vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>

" rename with dialog
nnoremap gr :OmniSharpRename<cr>
nnoremap <F2> :OmniSharpRename<cr>
" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

" Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
" Load the current .cs file to the nearest project
nnoremap <leader>tp :OmniSharpAddToProject<cr>

" (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
nnoremap <leader>ss :OmniSharpStartServer<cr>
nnoremap <leader>sp :OmniSharpStopServer<cr>

" Add syntax highlighting for types and interfaces
nnoremap <leader>th :OmniSharpHighlightTypes<cr>
"Don't ask to save when changing buffers (i.e. when jumping to a type definition)
set hidden

" Enable snippet completion, requires completeopt-=preview
let g:OmniSharp_want_snippet=1
"openIDE
map <C-S-j> :let x = system('oi set-to-foreground ContinuousTests "ContinuousTests Standalone Client"')<cr>
imap <C-S-j> <Esc>:let x = system('oi set-to-foreground ContinuousTests "ContinuousTests Standalone Client"')<cr>
map <C-S-t> :let x = system('oi gototype')<cr>
imap <C-S-t> <Esc>:let x = system('oi gototype')<cr>
map <C-S-e> :let x = system('oi explore')<cr>
imap <C-S-e> <Esc>:let x = system('oi explore')<cr>

"set Ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

