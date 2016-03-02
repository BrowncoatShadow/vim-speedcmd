function! SpeedCmd()
  normal! mz
  let g:cmd_target = winnr()
  bot 9 new
  setlocal filetype=vim buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap cursorline modifiable norelativenumber number
  augroup autoclose
    autocmd BufLeave * :bdelete | autocmd! autoclose
  augroup END
  nnoremap <silent> <buffer> q :call <SID>close_menu()<CR>
  nnoremap <silent> <buffer> <CR> :call <SID>run_line()<CR>
  nnoremap <silent> <buffer> 1 :1<CR>:call <SID>run_line()<CR>
  nnoremap <silent> <buffer> 2 :2<CR>:call <SID>run_line()<CR>
  nnoremap <silent> <buffer> 3 :3<CR>:call <SID>run_line()<CR>
  nnoremap <silent> <buffer> 4 :4<CR>:call <SID>run_line()<CR>
  nnoremap <silent> <buffer> 5 :5<CR>:call <SID>run_line()<CR>
  nnoremap <silent> <buffer> 6 :6<CR>:call <SID>run_line()<CR>
  nnoremap <silent> <buffer> 7 :7<CR>:call <SID>run_line()<CR>
  nnoremap <silent> <buffer> 8 :8<CR>:call <SID>run_line()<CR>
  nnoremap <silent> <buffer> 9 :9<CR>:call <SID>run_line()<CR>
  inoremap <silent> <buffer> <CR> <Esc>:call <SID>run_line()<CR>
  call append(1, g:speedcmd_menu)
  normal ggdd
  echo "[1-9] (Run Line) | <CR> (Run Current Line) | q (Close Menu)"
endfunction
  function! s:close_menu()
    bdelete
    execute g:cmd_target . "wincmd w"
  endfunction
  function! s:run_line()
    normal! "zyy
    call <SID>close_menu()
    exe getreg("z")
    normal! `z
  endfunction
