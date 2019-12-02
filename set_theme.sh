#!/bin/bash
if [[ -n $THEME ]]; then
    echo "Cahnging to theme $THEME."
    jt -t $THEME -fs 95 -altp -tfs 11 -nfs 115 -cellw 88% -T -N
else
    echo "Resetting theme."
    jt -r
fi
