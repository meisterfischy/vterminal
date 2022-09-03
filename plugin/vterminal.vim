" Prevents the plugin from being loaded multiple times. If the loaded
" variable exists, do nothing more. Otherwise, assign the loaded
" variable and continue running this instance of the plugin.
if exists("g:loaded_vterminal")
    finish
endif
let g:loaded_vterminal = 1
let g:vterminal_coverage = get(g:, 'vterminal_coverage', 0.33)

autocmd BufDelete * call vterminal#cleanup()

command! -nargs=0 VTermToggle call vterminal#toggle()
command! -nargs=0 VTermSwitch call vterminal#switch()
