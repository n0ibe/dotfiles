setlocal spell
setlocal spelllang=en_us,it
setlocal listchars=tab:\⇥\ ,

let b:delimitMate_quotes = "\" ' ` *"

nmap <buffer> <silent> <LocalLeader>lp :LivedownPreview<CR>
nmap <buffer> <silent> <LocalLeader>lk :LivedownKill<CR>
