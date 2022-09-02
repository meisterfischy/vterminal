let s:terminals = {}
let s:jumpbacks = {}

function vterminal#open()
    let current_page = tabpagenr()
    if !exists("s:terminals[current_page]")
        let s:jumpbacks[current_page] = win_getid()
        let vterminal_height = winheight(0) * g:vterminal_coverage
        bo term
        let s:terminals[current_page] = win_getid()
        exe "resize" vterminal_height
        set wfh
    endif
endfunction

function vterminal#cleanup()
    if count(s:terminals, win_getid())
        unlet s:terminals[tabpagenr()]
    endif
    if count(s:jumpbacks, win_getid())
        unlet s:jumpbacks[tabpagenr()]
    endif
endfunction

function vterminal#switch()
    let current_page = tabpagenr()
    if count(s:terminals, win_getid()) && exists("s:jumpbacks[current_page]")
        exe win_id2win(s:jumpbacks[current_page]) .. "wincm w"
    elseif count(s:jumpbacks, win_getid()) && exists("s:terminals[current_page]")
        exe win_id2win(s:terminals[current_page]) .. "wincm w"
    endif
endfunction
