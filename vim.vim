"…Ë÷√vimµƒ◊¢ Õ	
:setlocal fileformat=unix
:inoremap <leader>i <esc>:s/^/\" /<CR>i
:inoremap <leader>u <esc>:s/\" /<CR>i
:vnoremap <leader>i :s/^/\" /<CR>
:vnoremap <leader>u :s/\" /<CR>
:nnoremap <leader>i :s/^/\" /<CR>
:nnoremap <leader>u :s/\" /<CR>

:nnoremap <leader>b :so %<CR>
