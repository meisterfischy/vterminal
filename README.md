# vterminal

Example config

```vim
" Opens the terminal
nmap <silent> <F10> :call VTermOpen()<CR>
" Switches between the current document and the terminal
tnoremap <silent> <S-Tab> <C-W>:call VTermSwitch()<CR>
nnoremap <silent> <S-Tab> :call VTermSwitch()<CR>
" Controls how much of the current height will be used by the terminal
" Defaults to 33%
let g:vterminal_coverage = 0.33
```
