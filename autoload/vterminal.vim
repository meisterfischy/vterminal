let s:terminals = {}
let s:jumpbacks = {}

function vterminal#toggle(...)
    let current_page = tabpagenr()
    if !exists("s:terminals[current_page]")
        let s:jumpbacks[current_page] = win_getid()
        "let s:jumpbacks[current_page] = bufnr()
        let vterminal_height = winheight(0) * g:vterminal_coverage
        exe "bo term"
        if a:0 > 0
            exe term_sendkeys(bufnr(), a:1 . "\<CR>")
        endif
        "let s:terminals[current_page] = win_getid()
        let s:terminals[current_page] = bufnr()
        exe "resize" vterminal_height
        set wfh
    else
        "if getbufinfo(winbufnr(s:terminals[current_page]))[0].hidden
        if getbufinfo(s:terminals[current_page])[0].hidden
            let vterminal_height = winheight(0) * g:vterminal_coverage
            bo new
            exe "resize" vterminal_height
            set wfh
            "exe "b" winbufnr(s:terminals[current_page])
            exe "b" s:terminals[current_page]
        elseif s:jumpbacks[current_page] == win_getid() || s:terminals[current_page] == bufnr()
            echo s:terminals[current_page]
            "exe winbufnr(s:terminals[current_page]) .. "hide"
            exe bufwinnr(s:terminals[current_page]) .. "hide"
        endif
    endif
endfunction

function vterminal#cleanup()
    if count(s:terminals, bufnr())
        unlet s:terminals[tabpagenr()]
    endif
    if count(s:jumpbacks, bufnr())
        unlet s:jumpbacks[tabpagenr()]
    endif
endfunction

function vterminal#switch()
    let current_page = tabpagenr()
    "if count(s:terminals, win_getid()) && exists("s:jumpbacks[current_page]")
    if count(s:terminals, bufnr()) && exists("s:jumpbacks[current_page]")
        exe win_id2win(s:jumpbacks[current_page]) .. "wincm w"
        "exe bufwinnr(s:jumpbacks[current_page]) .. "wincm w"
    elseif count(s:jumpbacks, win_getid()) && exists("s:terminals[current_page]")
   " elseif count(s:jumpbacks, bufnr()) && exists("s:terminals[current_page]")
        "exe win_id2win(s:terminals[current_page]) .. "wincm w"
        exe bufwinnr(s:terminals[current_page]) .. "wincm w"
    endif
endfunction
