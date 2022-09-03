# vterminal

Adds some helper functions around the building terminal mode in vim.
`VTermOpen` toggles a vertical terminal window at the bottom and
with `VTermSwitch` it is then possible to easily switch between the current window and the terminal.

Example config

```vim
" Opens the terminal
nmap <silent> <F10> :VTermToggle<CR>
tmap <silent> <F10> <C-W>:VTermToggle<CR>
" Switches between the current window and the terminal
tnoremap <silent> <S-Tab> <C-W>:VTermSwitch<CR>
nnoremap <silent> <S-Tab> :VTermSwitch<CR>
" Controls how much of the current height will be used by the terminal
" Defaults to 33%
let g:vterminal_coverage = 0.33
```
