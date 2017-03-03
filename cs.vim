"����ycm
"set runtimepath+=~/vim-ycm-20161024/YouCompleteMe


function OpenFileLocation()
if(expand("%")!="")
		execute "!start explorer /select,%"
	else
		execute "!start explorer /select,%:p:h"
	endif
endfunction

:nnoremap cm :call OpenFileLocation()<CR>

"����ע��//
:vnoremap ci :s/^/\/\/<CR>
:vnoremap cu :s/\/\//<CR>
:nnoremap ci :s/^/\/\/<CR>
:nnoremap cu :s/\/\//<CR>

"ͣ��ycm����Ϊ��Omnisharp��ͻ
"let g:ycm_auto_trigger=0

"---2017.3.1
filetype plugin on
let g:OmniSharp_host="http://localhost:2000"
let g:OmniSharp_timeout=1
set noshowmatch
set completeopt=longest,menuone,preview
set splitbelow
"--end

"���ú����ļ�����
let NERDTreeIgnore=['\.meta$','\.lua$','\.pb$']
let g:ctrlptom_ignore='!\.cs$'
let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows

"set wildignore+=*\\tmp\\*,*\\*svn*\\*,*.swp,*.zip,*.exe,*.meta,*.unity,*.assets,*.txt,*.dll " Windows

"�����﷨����
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
    autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
    autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr> "finds members in the current buffer
    " cursor can be anywhere on the line containing an issue 
    autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>  
    autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr> "navigate up by method/property/field
    autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr> "navigate down by method/property/field


augroup END

" Contextual code actions (requires CtrlP)
nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
" Run code actions with text selected in visual mode to extract method
vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>


" rename with dialog
nnoremap gr:OmniSharpRename<cr>
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