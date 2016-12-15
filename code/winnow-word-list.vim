set noautochdir
set noignorecase
split search_terms.txt
nnoremap <script> * :call <SID>LookForThisLine()<cr>

function! <SID>LookForThisLine()
    let l:line = getline('.')
    let l:regex = '/\<' . line . '\>/j' " full word, and do not open quickfix

    echo l:regex
    execute 'lvimgrep' l:regex '*/*'
    execute 'lwindow'
endfunction
