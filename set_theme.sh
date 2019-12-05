#!/bin/bash
if [[ -n ${THEME} ]]; then
    echo "Changing to theme ${THEME}."
    jt -t $THEME -fs 95 -altp -tfs 11 -nfs 115 -cellw 88% -T -N
else
    echo "Resetting theme."
    jt -r
fi
if [[ ${PLT_DARK_THEME:-0} -eq 1 ]]; then
    # Change matplotlib theme to dark theme defined at my github
    # TODO
    ;
else
    # Restore default matplotlib theme 
    # TODO
    ;
fi
