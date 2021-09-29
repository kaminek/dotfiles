" c indentation
" l1: indent block inside case correctly
" :0: indent case on the same level as the switch
" (0: indent unclosed [argument list|conditional] on the same level as the
"     openning parentheses
setlocal nosmartindent
setlocal cindent
setlocal cinoptions=:0,(0,u0,U0,l1
setlocal noexpandtab
setlocal shiftwidth=8
setlocal tabstop=8
setlocal softtabstop=0
